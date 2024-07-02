require('lualine').setup({
    options = {
        theme = 'base16'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = {'location'}
  },
})
