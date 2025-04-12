local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local opts = {
  sources = {
    formatting.prettierd,
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    formatting.black,
    formatting.stylua,
formatting.stylua.with({
    name = "pint",
    filetypes = { "php" },
    command = "pint",
    args = { "--test", "--no-interaction", "$FILENAME", "--quiet" },  -- Added --test flag
    to_stdin = false,
    format_on_save = false,  -- Optional: prevent automatic formatting
    on_success = function(result)
        -- Handle the output appropriately
        if result.output:find("FIXED") then
            -- If Pint fixed issues, we might want to reload the file
            vim.cmd("e!")  -- Reload the current buffer
        end
        return result
    end
}),
    diagnostics.mypy.with {
      extra_args = function()
        local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    },
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.cmd "silent! write"
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
