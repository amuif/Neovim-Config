return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        color = {
          enabled = true, -- highlight color variables
        },
        on_attach = function(_, bufnr)
          local bufmap = function(mode, lhs, rhs)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
          end
          bufmap("n", "<leader>dr", ":FlutterRun<CR>")
          bufmap("n", "<leader>dd", ":FlutterDetach<CR>")
          bufmap("n", "<leader>dq", ":FlutterQuit<CR>")
          bufmap("n", "<leader>h", ":FlutterHotReload<CR>")
          bufmap("n", "<leader>H", ":FlutterHotRestart<CR>")
        end,
      },
    })
  end,
}
