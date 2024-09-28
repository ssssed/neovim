local status, comment = pcall(require, 'Comment')
if (not status) then return end

comment.setup {
  toggler = {
    line = 'cl',
    block = 'cb'
  },
  opleader = { line = 'cl', block = 'cb' },
  mappimgs = {
    basic = true,
    extra = false
  }
}
