local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".idea",
      ".git",
      "*.lock",
      "*.log"
    },
    mappings = {
      n = {
        ['q'] = actions.close,
      }
    }
  },
}


local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'ff', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = true, hidden = true })<cr>',
  opts)
vim.keymap.set('n', 'ft', '<cmd>lua require("telescope.builtin").live_grep()<cr>',
  opts)
vim.keymap.set('n', '////', '<cmd>lua require("telescope.builtin").buffers()<cr>',
  opts)
