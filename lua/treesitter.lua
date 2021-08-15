require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "dockerfile",
    "lua",
    "javascript"
  },
  highlight = {
    enable = true,
    disable = {"tsx", "html"} -- tsx and html files somehow look better without nvim-treesitter
  },
  indent = {
    enable = true
  }
}
