local cmd = vim.cmd

cmd("set termguicolors")
cmd("syntax on")
cmd("set number")
cmd("set encoding=UTF-8")
cmd("set mouse=a")

cmd("au FileType go set noexpandtab")
cmd("au FileType go set shiftwidth=4")
cmd("au FileType go set softtabstop=4")
cmd("au FileType go set tabstop=4")

cmd("au FileType lua set noexpandtab")
cmd("au FileType lua set shiftwidth=2")
cmd("au FileType lua set softtabstop=2")
cmd("au FileType lua set tabstop=2")

cmd("colorscheme everforest")

