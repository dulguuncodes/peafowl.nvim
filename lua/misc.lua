local cmd = vim.cmd

cmd("au FileType go set noexpandtab")
cmd("au FileType go set shiftwidth=4")
cmd("au FileType go set softtabstop=4")
cmd("au FileType go set tabstop=4")

cmd("au FileType lua set expandtab")
cmd("au FileType lua set shiftwidth=2")
cmd("au FileType lua set softtabstop=2")
cmd("au FileType lua set tabstop=2")
