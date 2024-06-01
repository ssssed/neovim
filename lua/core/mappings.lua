vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<q>', '<cmd>:q<CR>')

-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('i', '<leader>w', '<Esc>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>E', ':NvimTreeFocus<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>j>', ':ToggleTerm direction=float<CR>')
