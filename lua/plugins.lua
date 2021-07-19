local packer = require("packer")
local use = packer.use
local use_rock = packer.use_rocks

-- Resolves issues where dashboard-nvim isn't initialized
vim.cmd [[packadd dashboard-nvim]]
vim.cmd [[packadd vim-workspace]]

return require("packer").startup(function()
    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
    }

    use {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle"
    }

    use { 'nvim-treesitter/nvim-treesitter', config = function()
		require("treesitter")
	end}

    use {
				'neoclide/coc.nvim',
        branch = 'release'
    }

    -- todo: implement lazy loading
    -- use 'f-person/git-blame.nvim'

    use 'romgrk/barbar.nvim'

    -- use 'tpope/vim-obsession'
		use { os.getenv("HOME") .. '/Code/vim-workspace' }
		-- use { 'dulguuncodes/vim-workspace', opt = true, cmd = {"ToggleWorkspace", "ToggleAutosave"} }

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
			cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave" },
			setup = function()
				require("dashboard")
			end
		}

    -- use {
    --     "~/Code/dashboard-nvim",
    --     cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave"},
    --     setup = function()
    --       require("dashboard")
    --     end
    -- }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }

		use {'terrortylor/nvim-comment', config = function() require("comment") end}
end)

