local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hoob3rt/lualine.nvim' -- Status line
  use 'kyazdani42/nvim-web-devicons'
  use 'L3MON4D3/LuaSnip'     -- Snippets
  use 'onsails/lspkind-nvim' -- vscode autocomplete view
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path' -- Источник для автодополнения путей
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip'
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'MunifTanjim/prettier.nvim'

  -- Mason
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvimdev/lspsaga.nvim' -- LSP UIs

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Explorer
  use 'MunifTanjim/nui.nvim' -- utils to neo-tree
  use '3rd/image.nvim'       -- utils to neo-tree
  use 'nvim-neo-tree/neo-tree.nvim'

  -- Bufferline
  use 'akinsho/nvim-bufferline.lua'

  -- Transparrent Background
  use 'xiyaowong/transparent.nvim'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Git highlights
  use 'lewis6991/gitsigns.nvim'

  -- Theme
  use 'gmr458/vscode_modern_theme.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Autosave
  use 'Pocco81/auto-save.nvim'

  -- Comment
  use 'numToStr/Comment.nvim'

  -- Todo highlights
  use 'folke/todo-comments.nvim'

  -- Terminal
  use 'akinsho/toggleterm.nvim'

  -- Lazygit
  use 'kdheepak/lazygit.nvim'
end)
