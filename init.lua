-- Many features will not work if these imports are out of order
require("variables")
require("plugins")
require("mappings")
require("statusline")
require("misc")
require("highlight")

vim.cmd("source " .. os.getenv("HOME") .. "/.config/nvim/vim/session.vim")
