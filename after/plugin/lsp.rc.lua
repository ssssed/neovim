local ok, lsp = pcall(require, 'lsp')
if not ok then
  return
end

lsp.setup()
