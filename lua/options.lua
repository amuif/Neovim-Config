require "nvchad.options"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- start unfolded
vim.opt.foldlevelstart = 99 -- open all folds by default
vim.opt.foldcolumn = "1" -- show fold column
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
