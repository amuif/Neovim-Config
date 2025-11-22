return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false, -- disables the breadcrumb in the winbar
      },
      ui = {
        -- Define how the saga icons should look
        theme = "round",
        -- Customize border for floating windows
        border = "rounded",
        -- Show lines for hover window
        winblend = 0,
        expand = "",
        collapse = "",
      },

      code_action = {
        enable = true,
        keys = {
          -- Mapping to trigger code actions
          quit = "q",
          exec = "<CR>", -- Enter key to execute the action
        },
      },
      rename = {
        enable = true,
        keys = {
          quit = "<Esc>", -- Mapping to exit the rename prompt
          exec = "<CR>", -- Enter key to apply the rename
        },
      },
      diagnostic = {
        enable = true,
        keys = {
          -- Mapping to jump to next/prev diagnostic
          next = "n",
          prev = "p",
        },
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
