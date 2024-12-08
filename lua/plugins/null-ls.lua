return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					timeout = 5000, -- Timeout set to 5 seconds (adjust as needed)
				}),
				null_ls.builtins.formatting.prettierd.with({
					timeout = 5000, -- Timeout set to 5 seconds (adjust as needed)
				}),
				null_ls.builtins.formatting.rubocop.with({
					timeout = 5000, -- Timeout set to 5 seconds (adjust as needed)
				}),
				null_ls.builtins.diagnostics.eslint_d.with({
					timeout = 5000, -- Timeout set to 5 seconds (adjust as needed)
				}),
				null_ls.builtins.diagnostics.rubocop.with({
					timeout = 5000, -- Timeout set to 5 seconds (adjust as needed)
				}),
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
