local status, transparent = pcall(require, 'transparent')
if (not status) then return end

--transparent.clear_prefix('BufferLine')
transparent.clear_prefix('NeoTree')
-- transparent.clear_prefix('lualine')

transparent.setup()
