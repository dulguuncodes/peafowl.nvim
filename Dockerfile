FROM alpine:latest

ENV XDG_DATA_DIR=/home/peafowl/.local/share \
    XDG_CONFIG_HOME=/home/peafowl/.config \
    PATH="/usr/local/bin:${PATH}"

RUN apk add --no-cache nodejs \
                       npm \
                       build-base \
                       wget \
                       gzip

ENV GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc
ENV GLIBC_VERSION=2.30-r0

RUN addgroup "peafowl" \
    && adduser -D -G "peafowl" -g "root" -s "fish" -u "1003" "peafowl"

RUN set -ex && \
    apk --update add libstdc++ curl ca-certificates && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION}; \
        do curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; done && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

RUN wget http://github.com/tree-sitter/tree-sitter/releases/download/0.15.12/tree-sitter-linux-x64.gz
RUN gzip -d tree-sitter-linux-x64.gz
RUN chmod u+x tree-sitter-linux-x64
RUN chown peafowl:peafowl tree-sitter-linux-x64
RUN mv tree-sitter-linux-x64 /usr/local/bin/tree-sitter

WORKDIR /home/peafowl

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk update
RUN apk upgrade

RUN apk add --no-cache git \
                       neovim \
                       neovim-doc \
                       go \
                       shadow

RUN nvim --headless --noplugin "+lua print(vim.fn.executable('tree-sitter'))" "+quitall"

RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/peafowl/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY . /home/peafowl/.config/nvim

RUN chown -R peafowl:peafowl /home/peafowl
RUN chmod 755 -R /home/peafowl

RUN mkdir /mnt/workspace && chown -R peafowl:peafowl /mnt/workspace
RUN chmod 755 -R /mnt/workspace

VOLUME "/mnt/workspace"

RUN usermod -u "1003" peafowl && \
    groupmod -g "1003" peafowl

USER peafowl

RUN nvim --headless --noplugin -u /home/peafowl/.config/nvim/bootstrap.lua "+autocmd User PackerComplete quitall" "+silent! PackerSync"

COPY entrypoint.sh /usr/local/bin/

VOLUME "/home/peafowl"

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh", "/mnt/workspace"]
