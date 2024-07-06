local status, autosave = pcall(require, 'auto-save')
if (not status) then return end

autosave.setup({
  enable = true,
  trigger_events = { 'BufWinLeave' },
  write_all_buffers = true,
})

vim.api.nvim_set_keymap("n", "tas", ":ASToggle<CR>", {})
