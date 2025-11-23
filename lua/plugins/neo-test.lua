
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
 "nvim-neotest/nvim-nio",
    -- test adapters (choose your language)
    "nvim-neotest/neotest-jest",
    -- "nvim-neotest/neotest-python",
    -- "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require ("neotest-jest"),
        -- require "neotest-python"(),
        -- require "neotest-go"(),
      },
    }
  end,
}
