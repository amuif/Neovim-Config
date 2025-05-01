-- Load defaults (i.e., lua_lsp)
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

-- List of servers with default config
local servers =
{ "html", "cssls", "ts_ls", "tailwindcss", "eslint", "astro", "intelephense", "emmet_language_server"  }

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if lsp == "intelephense" then
    opts.root_dir = util.root_pattern("composer.json", ".git", "*.php")
    opts.filetypes = { "php" }
  end
  if lsp == "tailwindcss" then
    opts.filetypes = { "html", "php", "blade", "javascript", "typescript", "javascriptreact", "typescriptreact" }
    opts.init_options = {
      userLanguages = {
        php = "html",
      },
    }
  end

  lspconfig[lsp].setup(opts)
end

-- Go LSP setup
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Python LSP setup
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
