require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

vim.keymap.set({ "n", "v" }, "<leader>ca", function()
  require("lspsaga.codeaction"):code_action()
end, { desc = "LSPSaga Code Action" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/custom/mappings.lua
local map = vim.api.nvim_set_keymap

-- makes jk emitate escape 
vim.api.nvim_set_keymap("i","jk","<ESC>",{noremap=false})
-- Show diagnostic float with 'q' to close
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, {
    focus = true,
    border = "rounded",
    source = "always",
  })

  -- Automatically map 'q' to close the float if it's a diagnostic window
  vim.cmd([[
    augroup DiagnosticFloat
      autocmd!
      autocmd BufWinEnter * if &buftype ==# 'nofile' | nnoremap <buffer> q :close<CR> | endif
    augroup END
  ]])
end,{ desc = "Show line diagnostics" })
