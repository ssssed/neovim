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