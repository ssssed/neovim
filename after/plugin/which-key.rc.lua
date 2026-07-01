local ok, wk = pcall(require, 'which-key')
if not ok then
  return
end

wk.setup({
  delay = 300,
  icons = {
    breadcrumb = '»',
    separator = '➜',
    group = '+',
  },
})

wk.add({
  { '<Space>', group = 'commands' },
  { '<Space>f', group = 'find' },
  { '<Space>ff', desc = 'Find files' },
  { '<Space>ft', desc = 'Live grep' },
  { '<Space>g', desc = 'LazyGit' },
  { '<Space>w', desc = 'Format & save' },
  { '<Space>lf', desc = 'Format buffer' },
  { '<Space>c', desc = 'Close buffer' },
  { 'tt', desc = 'Float terminal' },
  { 'tr', desc = 'Terminal right' },
  { 'tl', desc = 'Terminal left' },
  { 'tb', desc = 'Terminal bottom' },
  { '////', desc = 'Buffers' },
  { mode = 'n', group = 'LSP' },
  { 'K', desc = 'Hover doc', mode = 'n' },
  { 'gd', desc = 'Go to definition', mode = 'n' },
  { 'gr', desc = 'Rename', mode = 'n' },
})
