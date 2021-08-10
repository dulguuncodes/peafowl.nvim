FROM alpine:latest

RUN apk add --no-cache nodejs \
                       npm \
                       build-base

RUN npm install -g tree-sitter-cli

WORKDIR /home/peafowl

ENV XDG_DATA_DIR=/home/peafowl/.local/share \
    XDG_CONFIG_HOME=/home/peafowl/.config

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories
RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk update
RUN apk upgrade

RUN apk add --no-cache git \
                       neovim \
                       neovim-doc \
                       go

RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/peafowl/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN addgroup "peafowl" \
    && adduser -D -G "peafowl" -g "" -s "fish" "peafowl"

COPY . /home/peafowl/.config/nvim

RUN chown -R peafowl:peafowl /home/peafowl
RUN chmod 755 -R /home/peafowl

USER peafowl

RUN nvim --headless --noplugin -u /home/peafowl/.config/nvim/bootstrap.lua "+autocmd User PackerComplete quitall" "+silent! PackerSync"

COPY entrypoint.sh /usr/local/bin/

VOLUME "/home/peafowl"

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
