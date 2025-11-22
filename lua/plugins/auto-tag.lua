return {
  "windwp/nvim-ts-autotag",
  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "HTML", "svelte" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
