local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'scss', 'less', 'sass',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'html',
    'vue',
    'svelte',
    'json',
  }
}

-- Prettier в проекте: useTabs: true — совпадаем с форматтером, иначе при <Space>w
-- меняются все отступы и gitsigns подсвечивает «пробелы» как __ (word diff).
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
    'svelte',
    'json',
    'css',
    'scss',
    'less',
    'html',
  },
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end,
})
