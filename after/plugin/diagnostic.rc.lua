vim.diagnostic.config({
  signs = false,
  underline = true,
  virtual_lines = false,
  virtual_text = {
    prefix = '',
    spacing = 1,
    source = false,
    virt_text_pos = 'eol',
    severity = { min = vim.diagnostic.severity.HINT },
  },
})

local severity_label = {
  [vim.diagnostic.severity.ERROR] = 'Error',
  [vim.diagnostic.severity.WARN] = 'Warn',
  [vim.diagnostic.severity.INFO] = 'Info',
  [vim.diagnostic.severity.HINT] = 'Hint',
}

local function diagnostic_lines(diags)
  local lines = {}
  for _, diag in ipairs(diags) do
    local label = severity_label[diag.severity] or 'Diag'
    local source = diag.source and (' [' .. diag.source .. ']') or ''
    local header = string.format('%s%s:', label, source)
    local parts = vim.split(diag.message, '\n', { plain = true })
    for i, part in ipairs(parts) do
      lines[#lines + 1] = (i == 1 and header .. ' ' or '  ') .. part
    end
    if #diags > 1 then
      lines[#lines + 1] = ''
    end
  end
  if lines[#lines] == '' then
    table.remove(lines)
  end
  return lines
end

local function show_line_diagnostic()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(bufnr, { lnum = lnum })

  if #diags == 0 then
    vim.notify('Нет диагностик на этой строке', vim.log.levels.INFO)
    return
  end

  table.sort(diags, function(a, b)
    return a.severity < b.severity
  end)

  local lines = diagnostic_lines(diags)
  local width = 20
  for _, line in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end
  width = math.min(width + 2, vim.o.columns - 4)

  local float_bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(float_bufnr, 0, -1, false, lines)
  vim.bo[float_bufnr].modifiable = false
  vim.bo[float_bufnr].bufhidden = 'wipe'
  vim.bo[float_bufnr].filetype = 'markdown'

  local orig_win = vim.api.nvim_get_current_win()
  local float_win = vim.api.nvim_open_win(float_bufnr, true, {
    relative = 'cursor',
    row = 1,
    col = 0,
    width = width,
    height = #lines,
    style = 'minimal',
    border = 'rounded',
    focusable = true,
    title = ' Diagnostic ',
    title_pos = 'center',
  })

  local function close_float()
    if vim.api.nvim_win_is_valid(float_win) then
      vim.api.nvim_win_close(float_win, true)
    end
    if vim.api.nvim_win_is_valid(orig_win) then
      vim.api.nvim_set_current_win(orig_win)
    end
  end

  local opts = { buffer = float_bufnr, silent = true, nowait = true }

  vim.keymap.set('n', 'q', close_float, opts)
  vim.keymap.set('n', '<Esc>', close_float, opts)
  vim.keymap.set('n', 'y', function()
    vim.fn.setreg('+', table.concat(lines, '\n'))
    vim.notify('Текст ошибки скопирован', vim.log.levels.INFO)
  end, opts)
end

vim.keymap.set('n', '<Space>k', show_line_diagnostic, { desc = 'Диагностика строки' })
