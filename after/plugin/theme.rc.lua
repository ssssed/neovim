local status, theme = pcall(require, 'vscode_modern')
if (not status) then return end

theme.setup({
  cursorline = true,
  transparent_background = true,
  nvim_tree_darker = true
})

vim.cmd.colorscheme("vscode_modern")
