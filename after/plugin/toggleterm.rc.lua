local status, toggleterm = pcall(require, 'toggleterm')
if not status then
  return
end

toggleterm.setup({
  direction = 'float',
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local Terminal = require('toggleterm.terminal').Terminal
local TERM_SIDE = 55
local TERM_BOTTOM = 15

local lazygit = Terminal:new({
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
  count = 5,
  on_open = function()
    vim.cmd('startinsert!')
  end,
})

local right_term = Terminal:new({
  direction = 'vertical',
  size = TERM_SIDE,
  hidden = true,
  count = 1,
  on_open = function()
    vim.cmd('startinsert!')
  end,
})

local left_term = Terminal:new({
  direction = 'vertical',
  size = TERM_SIDE,
  hidden = true,
  count = 2,
})

local bottom_term = Terminal:new({
  direction = 'horizontal',
  size = TERM_BOTTOM,
  hidden = true,
  count = 3,
  on_open = function()
    vim.cmd('startinsert!')
  end,
})

local function open_left_term()
  vim.cmd('leftabove vsplit')
  local win = vim.api.nvim_get_current_win()
  if not left_term.bufnr or not vim.api.nvim_buf_is_valid(left_term.bufnr) then
    left_term:spawn()
  end
  vim.api.nvim_win_set_buf(win, left_term.bufnr)
  left_term.window = win
  vim.bo[left_term.bufnr].filetype = 'toggleterm'
  vim.bo[left_term.bufnr].buflisted = false
  vim.b[left_term.bufnr].toggle_number = left_term.id
  vim.wo[win].winfixwidth = true
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.cmd('vertical resize ' .. TERM_SIDE)
  vim.cmd('startinsert!')
end

function _G.toggle_left_term()
  if left_term:is_open() then
    left_term:close()
    return
  end
  open_left_term()
end

function _G.toggle_right_term()
  right_term:toggle(TERM_SIDE)
end

function _G.toggle_bottom_term()
  bottom_term:toggle(TERM_BOTTOM)
end

vim.keymap.set('n', '<Space>g', function()
  lazygit:toggle()
end, { noremap = true, silent = true })

vim.keymap.set('n', 'tt', '<cmd>ToggleTerm direction=float name=float<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tr', '<cmd>lua toggle_right_term()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tl', '<cmd>lua toggle_left_term()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tb', '<cmd>lua toggle_bottom_term()<CR>', { noremap = true, silent = true })

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
