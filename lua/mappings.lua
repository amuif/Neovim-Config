require "nvchad.mappings"
local map = vim.keymap.set
local ufo = require("ufo")

-- Folding
map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
map("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
map("n", "zp", ufo.peekFoldedLinesUnderCursor, { desc = "Peek fold" })
map("n", "za", function()
  if not ufo.peekFoldedLinesUnderCursor() then
    vim.cmd("normal! za")
  end
end, { desc = "Toggle fold (with peek)" })

-- Command mode shortcut
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Escape jk in insert mode
map("i", "jk", "<ESC>")

-- Save shortcut
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>")

-- Tabs
map({ "n", "i", "v" }, "<C-t>", "<cmd>tabnew<CR>", { desc = "New tab" })
map({ "n", "i", "v" }, "<C-q>", "<cmd>tabclose<CR>", { desc = "Close tab" })
map({ "n", "i", "v" }, "<leader><Right>", "<cmd>tabnext<CR>", { desc = "Next tab" })
map({ "n", "i", "v" }, "<leader><Left>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- LSP Saga
map({ "n", "v" }, "<leader>ca", function()
  require("lspsaga.codeaction"):code_action()
end, { desc = "LSPSaga Code Action" })

-- Diagnostic float
map("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, {
    focus = true,
    border = "rounded",
    source = "always",
  })
  vim.cmd([[
    augroup DiagnosticFloat
      autocmd!
      autocmd BufWinEnter * if &buftype ==# 'nofile' | nnoremap <buffer> q :close<CR> | endif
    augroup END
  ]])
end, { desc = "Show line diagnostics" })
