require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "lua", "tsx", "javascript" },
  autopairs = {enable = true},
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}