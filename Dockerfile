FROM alpine:latest

ENV XDG_DATA_DIR=/home/peafowl/.local/share \
    XDG_CONFIG_HOME=/home/peafowl/.config \
    PATH="/usr/local/bin:${PATH}" \
    GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc \
    GLIBC_VERSION=2.30-r0

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories && \
    echo https://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories

RUN apk update && apk upgrade

RUN apk add --no-cache nodejs \
                       npm \
                       yarn \
                       build-base \
                       wget \
                       gzip \
                       elixir \
                       git \
                       ninja

RUN addgroup "peafowl" && \
    adduser -D -G "peafowl" -g "root" -s "sh" -u "1003" "peafowl"

RUN set -ex && \
    apk --update add libstdc++ curl ca-certificates && \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION}; \
        do curl -sSL ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; done && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib

ENV MIX_ENV=prod

RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    chmod +x rebar3 && \
    mv rebar3 /usr/local/bin/rebar

RUN wget https://github.com/elixir-lsp/elixir-ls/archive/v0.7.0.tar.gz && \
    tar -xzvf v0.7.0.tar.gz && \
    cd elixir-ls-0.7.0 && \
    mix local.hex --force && \
    mix local.rebar --force rebar3 /usr/local/bin/rebar && \
    mix deps.get && \
    mix compile && \
    mkdir /usr/lib/elixir-ls && \
    mix elixir_ls.release -o /usr/lib/elixir-ls && \
    echo -e "#!/bin/sh\nexec /usr/lib/elixir-ls/language_server.sh" > "${pkgdir}"/usr/bin/elixir-ls && \
    echo -e "#!/bin/sh\nexec /usr/lib/elixir-ls/debugger.sh" > "${pkgdir}"/usr/bin/elixir-ls-debug && \
    chmod +x /usr/bin/elixir-ls /usr/bin/elixir-ls-debug

RUN yarn global add diagnostic-languageserver

RUN yarn global add "typescript-language-server@0.5.4"

RUN git clone https://github.com/sumneko/lua-language-server && \
    cd lua-language-server && \
    git checkout tags/2.3.4 && \
    git submodule init && \
    for i in ../{bee.lua,love-api,lpeglabel,luamake,rcedit}; do \
      git config submodule.3rd/${i##../}.url $i; done && \
    git submodule update && \
    cd 3rd/luamake && \
    git submodule init && \
    git config submodule.3rd/bee.lua.url ../bee.lua && \
    git submodule update

# snap back to reality

RUN cd lua-language-server && \
    ninja -C 3rd/luamake -f compile/ninja/linux.ninja && \
    ./3rd/luamake/luamake rebuild

# TODO: Refactor this bit of code as well
RUN cd lua-language-server && \
    echo -e '#!/usr/bin/env sh\nTMPPATH=$(mktemp -d "/tmp/lua-language-server.XXXX")\nDEFAULT_LOGPATH="$TMPPATH/log"\nDEFAULT_METAPATH="$TMPPATH/meta"\n\nexec /usr/lib/lua-language-server/lua-language-server -E /usr/share/lua-language-server/main.lua \\\n --logpath="$DEFAULT_LOGPATH" --metapath="$DEFAULT_METAPATH" "$@"' > /usr/bin/lua-language-server && \
    chmod u+x /usr/bin/lua-language-server && \
    chown peafowl:peafowl /usr/bin/lua-language-server && \
    chgrp peafowl /usr/bin/lua-language-server && \
    mkdir -p /usr/lib/lua-language-server /usr/share/lua-language-server && \
    cp -r bin/Linux/lua-language-server /usr/lib/lua-language-server  && \
    cp bin/Linux/*.so /usr/lib/lua-language-server && \
    cp debugger.lua /usr/share/lua-language-server && \
    cp main.lua /usr/share/lua-language-server && \
    cp platform.lua /usr/share/lua-language-server && \
    cp -r locale /usr/share/lua-language-server && \
    cp -r script /usr/share/lua-language-server && \
    cp -r meta /usr/share/lua-language-server


RUN wget http://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter-linux-x64.gz && \
    gzip -d tree-sitter-linux-x64.gz && \
    chmod u+x tree-sitter-linux-x64 && \
    chown peafowl:peafowl tree-sitter-linux-x64 && \
    mv tree-sitter-linux-x64 /usr/local/bin/tree-sitter

WORKDIR /home/peafowl

RUN apk add --no-cache neovim \
                       neovim-doc \
                       go \
                       shadow

RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/peafowl/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY . /home/peafowl/.config/nvim

RUN chown -R peafowl:peafowl /home/peafowl && \
    chmod 755 -R /home/peafowl

RUN mkdir /mnt/workspace && \
    chown -R peafowl:peafowl /mnt/workspace && \
    chmod 755 -R /mnt/workspace

VOLUME "/mnt/workspace"

RUN usermod -u "1003" peafowl && \
    groupmod -g "1003" peafowl

USER peafowl

RUN nvim --headless --noplugin -u /home/peafowl/.config/nvim/bootstrap.lua "+autocmd User PackerComplete quitall" "+silent! PackerSync"

COPY entrypoint.sh /usr/local/bin/

VOLUME "/home/peafowl"

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh", "/mnt/workspace"]
