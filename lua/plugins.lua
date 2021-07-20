local packer = require("packer")
local use = packer.use
local use_rock = packer.use_rocks

-- Resolves issues where dashboard-nvim isn't initialized
vim.cmd [[packadd dashboard-nvim]]

return require("packer").startup(function()
    use 'wbthomason/packer.nvim'
	
    use {
		  'sainnhe/everforest',
			config = function()
				vim.cmd("colorscheme everforest")
				require("highlight")
			end
		}

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle"
    }

    use {
        'nvim-treesitter/nvim-treesitter',
				run = ":TSInstall",
        config = function()
            require("treesitter")
        end
    }

    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }

    use 'romgrk/barbar.nvim'
    use 'tpope/vim-obsession'

    use 'wesQ3/vim-windowswap'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase'
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    use 'jiangmiao/auto-pairs'
    use 'machakann/vim-highlightedyank'

    use {
        'dulguuncodes/dashboard-nvim',
        cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave"},
        setup = function()
            require("dashboard")
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {
        'terrortylor/nvim-comment',
        config = function()
            require("comment")
        end
    }

    use 'neovim/nvim-lspconfig'
end)

