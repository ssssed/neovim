-- Настраиваем комбинации под разные функции
local builtin = require('telescope.builtin')

-- Работа с файлами и буфферами
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- Поиск файлов
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {}) -- Поиск текста
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Работа с Git
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<cr>')
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
