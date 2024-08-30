local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  return
end

-- Lua config
nvim_lsp.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_servers = {
  nvim_lsp.html,          -- support html language server
  nvim_lsp.css_variables, -- support css variables
  nvim_lsp.cssls,         -- support css language server
  nvim_lsp.cssmodules_ls, -- support css modules
  nvim_lsp.tailwindcss,   -- support tailwindcss
  nvim_lsp.tsserver,      -- support typescript and javascript
  nvim_lsp.yamlls,        -- support yaml language server
  nvim_lsp.dockerls,      -- support dockerls
  nvim_lsp.jsonls,        -- support json
}

for _, lsp_server in ipairs(lsp_servers) do
  lsp_server.setup {
    capabilities = lsp_capabilities,
  }
end
