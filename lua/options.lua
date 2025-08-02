require "nvchad.options"

-- add yours here!

vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3
vim.opt.foldtext = "v:lua.CustomFoldText()"

function _G.CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return  line .. "  ── " .. num_lines .. " lines"
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
