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

-- Open the database UI
map('n', '<leader>db', ':DBUI<CR>', { noremap = true, silent = true })

-- Database navigation
map('n', '<leader>dq', ':DBUIFindBuffer<CR>', { noremap = true, silent = true })
map('n', '<leader>ds', ':DBUIShow<CR>', { noremap = true, silent = true })

-- Querying a database
map('n', '<leader>dbq', ':DBUIQuery<CR>', { noremap = true, silent = true })
-- removes going to escape 
--
vim.api.nvim_set_keymap("i","jk","<ESC>",{noremap=false})
