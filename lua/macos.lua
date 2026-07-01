vim.opt.clipboard:append { 'unnamedplus' }

local homebrew = '/opt/homebrew/bin'
if vim.fn.isdirectory(homebrew) == 1 then
  vim.env.PATH = homebrew .. ':' .. (vim.env.PATH or '')
end
