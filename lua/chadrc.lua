---@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "github_dark",
  transparency = true,

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },
}

M.plugins = {
  gitsigns = {
    enable = false, -- Explicitly disable
  },
}
-- M.nvdash = {
--   -- load_on_startup = true, -- Show dashboard on startup
-- }
M.ui = {
  git = {
      enable = true, -- show git status icons (M, A, etc.)
    },
   nvimtree = {
    show_hidden = true,
  },
}

return M
