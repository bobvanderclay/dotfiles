vim.cmd [[packadd packer.nvim]]

local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- ========================================================================
    -- Git
    -- ------------------------------------------------------------------------
    use { 'tpope/vim-fugitive' }

    use {
      "lewis6991/gitsigns.nvim",
      after = "plenary.nvim",
      config = function()
          require "plugins.gitsigns"
      end
  }

    -- ========================================================================
    -- Theme, UI
    -- ------------------------------------------------------------------------
    -- Colorscheme
    use { 'sainnhe/gruvbox-material' }

    -- Bufferline
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }
    -- Alternatively, romgrk/barbar.nvim

    -- Status line
    use {
      "glepnir/galaxyline.nvim",
      config = function()
          require "plugins.statusline"
      end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        require "plugins.indentline"
      end
    }


    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
          require "plugins.nvimtree"
      end
    }

    -- ========================================================================
    -- Trees, Pickers
    -- ------------------------------------------------------------------------
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }



  end
)