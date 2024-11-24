local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Lua config
nvim_lsp.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[2].name
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

-- CSS config
nvim_lsp.cssls.setup {
  capabilities = capabilities,
  settings = {
    css = {
      validate = true, -- Включает валидацию CSS
    },
    scss = {
      validate = true, -- Поддержка SCSS
    },
  },
}

-- Tailwind config
nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      validate = false, -- Отключает валидацию в обычных CSS
    },
  },
}

local lsp_servers = {
  nvim_lsp.html,          -- support html language server
  nvim_lsp.css_variables, -- support css variables
  nvim_lsp.cssmodules_ls, -- support css modules
  nvim_lsp.ts_ls,         -- support typescript and javascript
  nvim_lsp.yamlls,        -- support yaml language server
  nvim_lsp.dockerls,      -- support dockerls
  nvim_lsp.jsonls,        -- support json
  nvim_lsp.prismals,      -- support prisma
  nvim_lsp.svelte,        -- support svelte
}

for _, lsp_server in ipairs(lsp_servers) do
  lsp_server.setup {
    capabilities = capabilities,
  }
end
