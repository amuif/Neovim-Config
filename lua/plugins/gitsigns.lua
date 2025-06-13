return {
  {
    "lewis6991/gitsigns.nvim",
    version = "v1.0.1",  -- replace with the tag, e.g., "v1.14.0"
    -- or use commit hash:
    -- commit = "abcdef1234567890abcdef1234567890abcdef12",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
