local execute = vim.api.nvim_command
local fn = vim.fn

local timeout = os.getenv("TIMEOUT")

if timeout == nil then
  timeout = 60
end

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local packer = require("packer")
local use = packer.use

return require("packer").startup(function()
    use 'wbthomason/packer.nvim'

    use {
      'sainnhe/everforest',
      config = function()
        vim.cmd("colorscheme everforest")
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
        run = ":TSUpdate"
    }

    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

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

    use 'lewis6991/gitsigns.nvim'

    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    use 'jiangmiao/auto-pairs'
    use 'machakann/vim-highlightedyank'

    use {
        'dulguuncodes/dashboard-nvim',
        cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave"}
    }

    use 'nvim-telescope/telescope.nvim'
    

    use 'terrortylor/nvim-comment'

    use 'neovim/nvim-lspconfig'

    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cmd = 'MarkdownPreview'
    }
end, {
    git = {
      clone_timeout = timeout
    }
})
