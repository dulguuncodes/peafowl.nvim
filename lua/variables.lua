local g = vim.g
local opt = vim.opt

-- sets the leader used in keymaps
g.mapleader = "\\"
g.loaded_python_provider = 0
g.loaded_perl_provider = 0
g.everforest_background = "hard"
g.indent_blankline_char = '┆'
g.indent_blankline_show_trailing_blankline_indent = false

g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "NvimTree"}
g.indent_blankline_buftype_exclude = {"terminal"}

g.dashboard_session_directory = os.getenv("HOME") .. "/.sessions" -- TODO: Refactor refactor refactor
g.workspace_session_directory = os.getenv("HOME") .. "/.sessions/"

g.dashboard_disable_session_saving_at_vimleave = 1

g.workspace_autocreate = 1
g.workspace_session_disable_on_args = 1
g.workspace_disable_on_vimenter = 1
g.workspace_autosave = 1

-- use this if you're debugging session loads
g.debug_sessions = 1

g.peafowl_lua_lsp_location = '/usr/bin/lua-language-server'
g.peafowl_lua_lsp_lib = '/usr/share/lua-language-server'

g.peafowl_elixir_lsp_location = '/usr/bin/elixir-ls'

g.nvim_tree_git_hl = 0
g.nvim_tree_gitignore = 0
g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

-- remove this to get rid of branding
g.peafowl_branding = 1

g.peafowl_lsp_list = {'graphql', 'html', 'bashls', 'gopls', 'elixirls', 'sumneko_lua'}

-- coc.nvim extensions
g.coc_global_extensions = {'coc-prettier', 'coc-eslint', 'coc-discord-rpc', 'coc-tsserver', 'coc-markdownlint'}

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.mouse = "a"
opt.number = true
opt.encoding = "UTF-8"
opt.termguicolors = true

