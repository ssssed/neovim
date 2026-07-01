local keymap = vim.keymap

-- Do ot yank with x
keymap.set('n', 'x', '"_x"')

-- Increment/decriment
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w ', { silent = true })


-- Move window
keymap.set('n', 'sw', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

local function clear_gitsigns_inline_diff(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ok, gitsigns_config = pcall(require, 'gitsigns.config')
  if ok then
    gitsigns_config.config.word_diff = false
    gitsigns_config.config.show_deleted = false
  end
  for name, ns in pairs(vim.api.nvim_get_namespaces()) do
    if name == 'gitsigns_preview_inline' or name == 'gitsigns_removed' then
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    end
  end
end

local function format_buffer()
  local formatted = vim.lsp.buf.format({
    async = false,
    timeout_ms = 10000,
    filter = function(client)
      return client.name == 'eslint'
    end,
  })
  if not formatted then
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end
end

-- Saving a file
vim.keymap.set('n', '<Space>lf', format_buffer, { noremap = true, silent = true })
vim.keymap.set('n', '<Space>w', function()
  format_buffer()
  if vim.bo.modified then
    local ok, err = pcall(vim.cmd, 'update')
    if not ok then
      vim.notify('Не удалось сохранить: ' .. tostring(err), vim.log.levels.ERROR)
      return
    end
  end
  clear_gitsigns_inline_diff()
  vim.wo.list = false
end, { noremap = true, silent = true })
