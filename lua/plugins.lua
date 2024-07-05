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
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Formatter
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- Mason
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvimdev/lspsaga.nvim' -- LSP UIs

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-lua/plenary.nvim' -- utils to telescope
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
end)
