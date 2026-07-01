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
