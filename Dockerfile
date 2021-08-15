FROM alpine:latest

ENV PATH="/usr/local/bin:${PATH}" \
    GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc \
    GLIBC_VERSION=2.30-r0 \
    MIX_ENV=prod \
    TREESITTER_VERSION=0.20.0 \
    USER=peafowl

ENV XDG_DATA_DIR=/home/${USER}/.local/share \
    XDG_CONFIG_HOME=/home/${USER}/.config

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories && \
    echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk update && apk upgrade

RUN apk add --no-cache neovim \
    neovim-doc \
    go \
    shadow \
    nodejs \
    bash \
    npm \
    yarn \
    build-base \
    wget \
    gzip \
    elixir \
    git \
    ninja

RUN addgroup ${USER} && \
    adduser -D -G ${USER} -g "root" -s "sh" -u "1003" ${USER}

WORKDIR /tmp

# https://stackoverflow.com/questions/66963068/docker-alpine-executable-binary-not-found-even-if-in-path
RUN set -ex && \
    apk --update add libstdc++ curl ca-certificates && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION}; \
    do curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o ${pkg}.apk; done && \
    apk add --allow-untrusted *.apk && \
    rm -v *.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

RUN wget -q http://github.com/tree-sitter/tree-sitter/releases/download/v${TREESITTER_VERSION}/tree-sitter-linux-x64.gz && \
    gzip --quiet -d tree-sitter-linux-x64.gz && \
    chmod u+x tree-sitter-linux-x64 && \
    chown ${USER}:${USER} tree-sitter-linux-x64 && \
    mv tree-sitter-linux-x64 /usr/local/bin/tree-sitter

RUN usermod -u "1003" ${USER} && \
    groupmod -g "1003" ${USER}

WORKDIR /home/${USER}

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/${USER}/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY . /home/${USER}/.config/nvim

RUN chown -R ${USER}:${USER} /home/${USER} && \
    chmod 755 -R /home/${USER}

RUN mkdir /mnt/workspace && \
    chown -R ${USER}:${USER} /mnt/workspace && \
    chmod 755 -R /mnt/workspace

VOLUME "/mnt/workspace"

USER ${USER}

RUN nvim --headless --noplugin -u /home/${USER}/.config/nvim/bootstrap.lua "+autocmd User PackerComplete quitall" "+silent! PackerSync"

COPY entrypoint.sh /usr/local/bin/

VOLUME "/home/${USER}"

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh", "/mnt/workspace"]
