---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "github_dark",
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
  nvimtree = {
    filters = {
      dotfiles = false, -- show hidden files (e.g., .env, .gitignore)
    },
    git = {
      enable = true, -- show git status icons (M, A, etc.)
    },
  },
  -- tabufline = {
  --   lazyload = false
  -- },
}

return M
