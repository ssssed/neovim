local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local M = {}

M.capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  ok_cmp and cmp_nvim_lsp.default_capabilities() or {}
)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Не все LSP-серверы поддерживают pull diagnostics (textDocument/diagnostic)
if M.capabilities.textDocument and M.capabilities.textDocument.diagnostic then
  M.capabilities.textDocument.diagnostic = nil
end

function M.on_attach(_, _) end

local default_opts = {
  capabilities = M.capabilities,
  on_attach = M.on_attach,
}

local function vue_ts_plugin_path(root_dir)
  return vim.fs.find('node_modules/@vue/typescript-plugin', { path = root_dir, upward = true })[1]
end

M.servers = {
  lua_ls = {
    on_init = function(client)
      local folder = client.workspace_folders and client.workspace_folders[1]
      if not folder then
        return
      end
      local path = folder.name
      if path == vim.fn.stdpath('config') then
        return
      end
      if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua or {}, {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          library = { vim.env.VIMRUNTIME },
        },
      })
    end,
    settings = { Lua = {} },
  },

  cssls = {
    settings = {
      css = { validate = true },
      scss = { validate = true },
    },
  },

  tailwindcss = {
    settings = {
      tailwindCSS = { validate = false },
    },
  },

  ts_ls = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'vue',
    },
    init_options = {
      hostInfo = 'neovim',
      plugins = {
        {
          name = '@vue/typescript-plugin',
          location = '',
          languages = { 'javascript', 'typescript', 'vue' },
        },
      },
    },
    on_new_config = function(new_config, new_root_dir)
      local plugin_path = vue_ts_plugin_path(new_root_dir)
      if plugin_path and new_config.init_options and new_config.init_options.plugins then
        new_config.init_options.plugins[1].location = plugin_path
      end
    end,
  },

  vue_ls = {
    filetypes = { 'vue' },
  },

  eslint = {
    settings = {
      validate = 'on',
      codeActionOnSave = { enable = false, mode = 'all' },
      experimental = {},
    },
    on_new_config = function(new_config, new_root_dir)
      local flat = vim.fs.find({
        'eslint.config.js', 'eslint.config.mjs', 'eslint.config.cjs',
        'eslint.config.ts', 'eslint.config.mts', 'eslint.config.cts',
      }, { path = new_root_dir, upward = true })[1]
      local legacy = vim.fs.find({
        '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml',
        '.eslintrc.yml', '.eslintrc.json',
      }, { path = new_root_dir, upward = true })[1]

      new_config.settings.experimental = new_config.settings.experimental or {}
      if flat then
        new_config.settings.experimental.useFlatConfig = true
      elseif legacy then
        new_config.settings.experimental.useFlatConfig = false
      end
    end,
    handlers = {
      ['eslint/noConfig'] = function()
        return {}
      end,
      ['eslint/probeFailed'] = function()
        return {}
      end,
      ['eslint/noLibrary'] = function()
        return {}
      end,
    },
  },

  emmet_language_server = {
    filetypes = {
      'css',
      'html',
      'javascriptreact',
      'less',
      'sass',
      'scss',
      'svelte',
      'typescriptreact',
      'vue',
    },
  },

  stylelint_lsp = {
    filetypes = { 'css', 'scss', 'sass', 'less', 'vue', 'sugarss' },
    settings = { stylelintplus = {} },
  },
}

M.ensure_installed = {
  'lua_ls',
  'ts_ls',
  'html',
  'cssls',
  'tailwindcss',
  'svelte',
  'vue_ls',
  'eslint',
  'emmet_language_server',
  'stylelint_lsp',
  'yamlls',
  'dockerls',
  'jsonls',
  'prismals',
  'css_variables',
  'cssmodules_ls',
}

local function configure_servers()
  for name, opts in pairs(M.servers) do
    vim.lsp.config(name, vim.tbl_deep_extend('force', default_opts, opts))
  end
end

function M.setup()
  mason.setup()
  configure_servers()

  mason_lspconfig.setup {
    ensure_installed = M.ensure_installed,
    automatic_enable = M.ensure_installed,
  }
end

return M
