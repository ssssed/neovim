local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {'phaazon/hop.nvim'}, {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    }, {'nvim-treesitter/nvim-treesitter'}, {'neovim/nvim-lspconfig'}, {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    },
    {
        "gmr458/vscode_modern_theme.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true
            })
            vim.cmd.colorscheme("vscode_modern")
        end
    }, {"williamboman/mason.nvim"},
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.4',
      dependencies = {'nvim-lua/plenary.nvim'}
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'jose-elias-alvarez/null-ls.nvim'}, {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'}, {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, {
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    }, {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }, {"folke/which-key.nvim"},
       { 'hrsh7th/vim-vsnip' },
    {'hrsh7th/vim-vsnip-integ'},
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
          {
            "s",
            mode = { "n", "x", "o" },
            function()
      require("flash").jump({
        search = {
          mode = function(str)
            return "\\<" .. str
          end,
        },
      })
            end,
            desc = "Flash",
          },
          {
            "S",
            mode = { "n", "o", "x" },
            function()
              require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
          },
          {
            "r",
            mode = "o",
            function()
              require("flash").remote()
            end,
            desc = "Remote Flash",
          },
          {
            "R",
            mode = { "o", "x" },
            function()
              require("flash").treesitter_search()
            end,
            desc = "Flash Treesitter Search",
          },
          {
            "<c-s>",
            mode = { "c" },
            function()
              require("flash").toggle()
            end,
            desc = "Toggle Flash Search",
          },
        },
      }
})
