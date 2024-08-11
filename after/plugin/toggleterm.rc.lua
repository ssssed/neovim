local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup({
  direction = 'float'
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", count = 5 })

_G.side_term   = nil

-- Функция для управления терминалом сбоку
function _G.toggle_side_term()
  if _G.side_term == nil then
    -- Создаем новый терминал, если он еще не существует
    _G.side_term = Terminal:new({
      direction = "vertical",
      size = 55,
      hidden = true,
    })
  end
  _G.side_term:toggle(55)
end

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<Space>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'tt', '<cmd>ToggleTerm direction=float name=float<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'tr', '<cmd>lua toggle_side_term()<CR>',
  { noremap = true, silent = true })

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
