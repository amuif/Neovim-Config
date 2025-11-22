return {
    "mattn/emmet-vim",
    config = function()
      vim.g.emmet_filetypes = {
        "html",
        "php",
        "blade",
        "javascriptreact",
        "typescriptreact",
      "svelte"
      }
      vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>(emmet-expand-abbr)", { noremap = false })
    end,
  }
