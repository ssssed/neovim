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
	-- Theme
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
    },

		-- fs Navigation
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

		-- telescope
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.6',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},

		-- lazy git
		{
			"kdheepak/lazygit.nvim",
			dependencies =  {
					"nvim-telescope/telescope.nvim",
					"nvim-lua/plenary.nvim"
			},
			config = function()
					require("telescope").load_extension("lazygit")
			end,
	},

    -- Терминал
    {'akinsho/toggleterm.nvim', version = "*", config = true},

		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			config = function()
					require'nvim-treesitter.configs'.setup {
							ensure_installed = {
									"bash",
									"css",
									"dockerfile",
									"html",
									"javascript",
									"json",
									"json5",
									"lua",
									"vim",
									"yaml",
							},
							sync_install = false,
							auto_install = true,
							highlight = {
									enable = true,
							},
					}
			end,
		},
		{ 'neovim/nvim-lspconfig' },

		-- Autocomplete support
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/nvim-cmp' },
		{ 'williamboman/mason.nvim' },

		-- Автоматическое открытие фигурных скобок, кавычек и т.д
		{ 'echasnovski/mini.nvim', version = false },
		{ 'echasnovski/mini.move', version = false },
		{ 'echasnovski/mini.pairs', version = false },
		{ "windwp/nvim-autopairs" },
})
