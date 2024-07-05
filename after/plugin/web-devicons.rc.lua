local status, icons = pcall(require, 'nvim-web-debicons')
if (not status) then return end

icons.setup {
  override = {},
  default = true
}
