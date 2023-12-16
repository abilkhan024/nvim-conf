-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end
  }

  use { 'tpope/vim-fugitive' }

  use { 'Shatur/neovim-session-manager' }

  use {'nvim-telescope/telescope-ui-select.nvim' }

  use { 'windwp/nvim-ts-autotag' }

  use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }

  use {
	  'catppuccin/nvim',
	  as = 'catppuccin',
	  config = function()
		  vim.cmd('colorscheme catppuccin')
	  end
  }

  use { 'sbdchd/neoformat' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use { 'jiangmiao/auto-pairs' }

  use { 'mg979/vim-visual-multi' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required

      -- Snippets not required for LSP
      {'hrsh7th/vim-vsnip'},    -- Snippets
      {'hrsh7th/cmp-vsnip'},    -- Snippets
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
     require('lspsaga').setup({
       lightbulb = { enable = false },
     })
   end,
  })

  use { 'bkad/CamelCaseMotion' }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
      }
    },
  }

  use { 'lewis6991/gitsigns.nvim' }

  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    tag = "*"
  }

  use 'mbbill/undotree'

  use { 'nvim-pack/nvim-spectre', requires = 'nvim-lua/plenary.nvim' }

  -- Use for folding tailwind classes
  -- use {
  --   "malbertzard/inline-fold.nvim",
  --   opts = {
  --     defaultPlaceholder = "…",
  --     queries = {
  --       -- Some examples you can use
  --       html = {
  --         { pattern = 'class="([^"]*)"', placeholder = "@" }, -- classes in html
  --         { pattern = 'href="(.-)"' }, -- hrefs in html
  --         { pattern = 'src="(.-)"' }, -- HTML img src attribute
  --       }
  --     },
  --   }
  -- }

  use { 'rhysd/conflict-marker.vim' }

end)
