local status, gitsigns = pcall(require, 'gitsigns')
if not status then
  return
end

local function clear_overlays(bufnr)
  for name, ns in pairs(vim.api.nvim_get_namespaces()) do
    if name == 'gitsigns_preview_inline' or name == 'gitsigns_removed' then
      vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
    end
  end

  local ok, deleted_preview = pcall(require, 'gitsigns.deleted_preview')
  if ok then
    deleted_preview.detach(bufnr)
  end
end

gitsigns.setup({
  signcolumn = true,
  sign_priority = 30,
  word_diff = false,
  linehl = false,
  numhl = false,
  signs = {
    add = { text = '│', show_count = false },
    change = { text = '|', show_count = false },
    delete = { text = '▁', show_count = false },
    topdelete = { text = '▔', show_count = false },
    changedelete = { text = '|', show_count = false },
    untracked = { text = '┆', show_count = false },
  },
  signs_staged = {
    add = { text = '│', show_count = false },
    change = { text = '|', show_count = false },
    delete = { text = '▁', show_count = false },
    topdelete = { text = '▔', show_count = false },
    changedelete = { text = '|', show_count = false },
  },
  on_attach = function(bufnr)
    local config = require('gitsigns.config').config
    config.word_diff = false
    config.show_deleted = false
    clear_overlays(bufnr)
  end,
})

-- Сброс inline preview / show_deleted, если были включены через :Gitsigns toggle_*
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local config = require('gitsigns.config').config
    config.word_diff = false
    config.show_deleted = false
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) then
        clear_overlays(bufnr)
      end
    end
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(args)
    local config = require('gitsigns.config').config
    config.word_diff = false
    config.show_deleted = false
    clear_overlays(args.buf)
  end,
})
