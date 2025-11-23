
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    dashboard = { enabled = false }, -- ❌ breaks NVChad
    picker = { enabled = false },    -- ❌ conflicts with NVChad telescope
    input = { enabled = false },     -- ❌ overrides NVChad UI
    notifier = { enabled = true },   -- ✔ ok
    terminal = { enabled = true },   -- ✔ ok
    statuscolumn = { enabled = false }, -- ❌ NVChad handles this
    indent = { enabled = true },     -- ✔ ok
  },
}
