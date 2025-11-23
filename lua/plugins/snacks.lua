return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    dashboard = { enabled = true }, -- ❌ breaks NVChad
    picker = { enabled = true},
    input = { enabled = false }, -- ❌ overrides NVChad UI
    notifier = { enabled = true }, -- ✔ ok
    terminal = { enabled = true }, -- ✔ ok
    statuscolumn = { enabled = false }, -- ❌ NVChad handles this
    indent = { enabled = true }, -- ✔ ok
  },
}
