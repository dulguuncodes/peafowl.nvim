require("nvim-treesitter.configs").setup {
    ensure_installed = {"dockerfile", "go", "javascript", "json", "elixir",
                        "lua", "python", "tsx", "typescript"},
    highlight = {
        enable = true,
        disable = {"tsx", "html"} -- typescript react files somehow look better without nvim-treesitter
    },
    indent = {
        enable = true
    }
}
