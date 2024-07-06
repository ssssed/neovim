local status, comment = pcall(require, 'Comment')
if (not status) then return end

comment.setup {
  toggler = {
    line = '<C-/>',
    block = '<C-b>/'
  },
  opleader = { line = '<C-/>', block = '<C-b>/' },
  mappimgs = {
    basic = true,
    extra = false
  }
}
