require "nvchad.mappings"
local map = vim.keymap.set
local ufo = require("ufo")
local neotest = require("neotest")
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

-- TDD
vim.keymap.set("n", "<leader>tn", function()
  neotest.run.run() -- nearest test
end)

vim.keymap.set("n", "<leader>tf", function()
  neotest.run.run(vim.fn.expand("%")) -- file tests
end)

vim.keymap.set("n", "<leader>ts", function()
  neotest.run.run({ suite = true }) -- full suite
end)

vim.keymap.set("n", "<leader>to", function()
  neotest.output.open({ enter = true })
end)

vim.keymap.set("n", "<leader>tt", function()
  neotest.summary.toggle()
end)

-- persistence
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore last session" })

map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Restore last session before the current one" })

map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Stop session saving" })

-- diff view 
map("n", "<leader>dv", function()
  local views = require("diffview.lib").views
  if next(views) == nil then
    vim.cmd("DiffviewOpen")
  else
    vim.cmd("DiffviewClose")
  end
end, { desc = "Toggle Diffview window" })
-- File history for current file inside diff view
map("n", "<leader>df", function()
  vim.cmd("DiffviewFileHistory %")
end, { desc = "Diffview: File history (current file)" })
