return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      vim.o.foldcolumn = "1" -- show fold column
      vim.o.foldlevel = 99  -- start unfolded
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup()
    end,
  },
}
