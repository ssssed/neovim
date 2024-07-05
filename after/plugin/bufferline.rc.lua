local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    always_show_bufferline = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    color_icons = true,
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>c', '<cmd>BufferLinePickClose<cr>', { noremap = true, silent = true })
