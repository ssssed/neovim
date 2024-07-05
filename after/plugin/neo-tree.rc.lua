local status, neotree = pcall(require, 'neo-tree')
if (not status) then return end


neotree.setup {
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
}

vim.keymap.set('n', '<Space>e', ':Neotree float toggle<CR>')
