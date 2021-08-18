vim.cmd [[packadd dashboard-nvim]]

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd("colorscheme everforest")
        require("highlight")
      end
    }

    use {
      "hrsh7th/nvim-compe",
      config = function()
        require "compe".setup {
          enabled = true,
          autocomplete = true,
          debug = false,
          min_length = 1,
          preselect = "enable",
          throttle_time = 80,
          source_timeout = 200,
          resolve_timeout = 800,
          incomplete_delay = 400,
          max_abbr_width = 100,
          max_kind_width = 100,
          max_menu_width = 100,
          documentation = {
            border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
            winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
            max_width = 120,
            min_width = 60,
            max_height = math.floor(vim.o.lines * 0.3),
            min_height = 1
          },
          source = {
            path = true,
            buffer = true,
            calc = true,
            nvim_lsp = true,
            nvim_lua = true,
            vsnip = true,
            ultisnips = true,
            luasnip = true
          }
        }
      end
    }

    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      requires = {
        "kyazdani42/nvim-web-devicons",
        opt = true
      }
    }

    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle"
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("treesitter")
      end
    }

    use "romgrk/barbar.nvim"
    use "tpope/vim-obsession"

    use "wesQ3/vim-windowswap"
    use "lukas-reineke/indent-blankline.nvim"
    use {
      "RRethy/vim-hexokinase",
      run = "make hexokinase" -- NOTE: Making vim-hexokinase requires go
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup()
      end
    }

    use "tpope/vim-fugitive"
    use "jiangmiao/auto-pairs"
    use "machakann/vim-highlightedyank"

    use {
      "dulguuncodes/dashboard-nvim",
      setup = function()
        require("dashboard")
      end
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    use {
      "terrortylor/nvim-comment",
      config = function()
        require("comment")
      end
    }

    use "neovim/nvim-lspconfig"

    use {
      "Iron-E/nvim-cartographer",
      config = function()
        require("maps")
      end
    }
  end
)
