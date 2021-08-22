local map = require("cartographer")

map.n.nore["<SPACE>"] = "<Nop>"
map.n.nore.silent["<Leader>s"] = "<Cmd>Obsess<CR>"

map.v.nore["<Leader>y"] = '"+y'
map.n.nore["<Leader>y"] = '"+y'
map.n.nore["<Leader>p"] = '"+p'
map.v.nore["<Leader>p"] = '"+p' -- TODO: When in visual mode, replace the text highlighted with the pasted text
map.n.nore.silent["<C-Right>"] = "<Cmd>tabnext<CR>"
map.n.nore.silent["<C-Left>"] = "<Cmd>tabprev<CR>"

map.n.nore.silent["<Leader>tr"] = "<Cmd>Telescope oldfiles<CR>"
map.n.nore.silent["<Leader>tf"] = "<Cmd>Telescope find_files<CR>"
map.n.nore.silent["<Leader>tg"] = "<Cmd>Telescope live_grep<CR>"
map.n.nore.silent["<Leader>tc"] = "<Cmd>Telescope git_commits<CR>"
map.n.nore.silent["<Leader>gb"] = "<Cmd>Telescope git_branches<CR>"
map.n.nore.silent["<Leader>ff"] = "<Cmd>Telescope current_buffer_fuzzy_find<CR>"
map.n.nore.silent["<Leader>fb"] = "<Cmd>Telescope buffers<CR>"
-- And more!

map.n.nore["<Leader>n"] = "<Cmd>NvimTreeToggle<CR>"
map.v.nore["<Leader>n"] = "<C-\\><C-n><Cmd>NvimTreeToggle<CR>"

map.n.nore.silent["<C-d>"] = "<Cmd>tabnew | Dashboard<CR>"
map.v.nore.silent["<C-d>"] = "<C-\\><C-n><Cmd>tabnew | Dashboard<CR>"

map.n.nore["<Leader>ca"] = vim.lsp.buf.code_action
map.n.nore["<Leader>f"] = vim.lsp.buf.formatting
map.n.nore["<Leader>r"] = vim.lsp.buf.rename
map.n.nore["<Leader>h"] = vim.lsp.buf.hover

map.i.nore["<D-d>"] = vim.lsp.buf.completion -- For MacOS users
map.i.nore["<C-d>"] = vim.lsp.buf.completion

map.n.nore["<Leader>gd"] = vim.lsp.buf.definition
map.n.nore["<Leader>gr"] = vim.lsp.buf.references
map.n.nore["<Leader>gt"] = vim.lsp.buf.type_definition
map.n.nore["<Leader>gi"] = vim.lsp.buf.implementation

map.n.nore["<Leader>li"] = "<Cmd>LspInfo<CR>"
