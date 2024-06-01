require("neo-tree").setup({

    filesystem = {
	source_selector = {
			winbar = false,
			statusline = false
	},
	window = {
        mapping_options = {
            noremap = true,
            nowait = true,
         },
        mappings = {
					  ["<F5>"] = "refresh",
            ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["o"] = { command = "open", nowait = true },
        }
  }
  }
})

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float toggle<CR>')
vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>')
