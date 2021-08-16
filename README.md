# 🦚 - Peafowl

An elegant Neovim configuration focused on customizability and performance.

![golang without it's lsp](./img/banner.png)

## Requirements

- Neovim 0.5+
- lua-language-server (for Lua LSP support) (optional)
- bash-language-server (for bash LSP support) (optional)
- graphql-lsp (for GraphQL LSP support) (optional)
- vscode-html-languageserver (for HTML LSP support) (optional)
- elixir-ls (for Elixir LSP support) (optional)
- A Nerd Font installed and configured (preferably `MesloLG Nerd Font`)

## Installation

**Warning: Make sure you have backed up your previous Neovim configuration**

```
git clone https://github.com/dulguuncodes/peafowl ~/.config/nvim
cd ~/.config/nvim
nvim -u bootstrap.lua --noplugin "+autocmd PackerComplete quitall" "+PackerSync"
```

**NOTE: You will see some errors on startup, ignore them. The installation will
start shortly**

## Supported Programming Languages

- ✅ - Fully Supported

- ⏳ - Half Supported/WIP

- ❌ - Not Supported

|        Language        |     Syntax Highlighting    | LSP support | Linting |
| ---------------------- | :------------------------: | :---------: | :-----: |
| Python                 |      ✅                    | ✅          | ✅      |
| Go                     |      ✅                    | ✅          | ✅      |
| Rust                   |      ✅                    | ✅          | ✅      |
| Elixir                 |      ✅                    | ✅          | ✅      |
| Typescript/Javascript  |      ✅                    | ✅          | ✅      |
| React (jsx/tsx)        |      ✅                    | ✅          | ✅      |
| Dart/Flutter           |      ✅                    | ✅          | ✅      |
| HTML                   |      ❌ (unstable)         | ⏳ (wip)    | ❌      |
| JSON                   |      ✅                    | ⏳ (wip)    | ✅      |
| Lua                    |      ✅                    | ⏳ (wip)    | ✅      |
| YAML                   |      ✅                    | ❌          | ✅      |
| Dockerfile             |      ✅                    | ❌          | ✅      |
| Shell (fish/bash/zsh)  |      ✅                    | ⏳ (wip)    | ✅      |
| GraphQL                |      ❌ (non-functional)   | ⏳ (wip)    | ❌      |

## TODO:

- [x] Support multiple architectures (Docker)
- [x] Use a better mapping system
- [ ] Debloat configuration by removing unused plugins and give the user more control.
- [ ] Document internal functions and utilities used
- [x] Rewrite key maps
- [x] Automate Docker builds
- [x] Publish a working release

### nvim-treesitter parsers don't work on Apple's M1 Chip

Before opening a Github issue, please ensure that both Neovim and your terminal
emulator are built for arm64 systems. You can tell if a program is running under
arm64 by going to the Activity Monitor.

