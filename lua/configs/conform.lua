local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    astro = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    svelte= { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    html = { "htmlbeautifier" },
    toml = { "taplo" },
    css = { "prettierd", "prettier" },
    go = { "gofmt" },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}
return options
