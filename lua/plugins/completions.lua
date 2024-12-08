return {
	-- Other plugins...

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- Buffer completions
			"hrsh7th/cmp-path", -- Path completions
			"hrsh7th/cmp-nvim-lsp", -- LSP completions
			"hrsh7th/cmp-vsnip", -- Snippet completions
			"hrsh7th/vim-vsnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completions
			"L3MON4D3/LuaSnip", -- Snippet engine
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- Use 'vsnip' for snippets
					end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
					["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
					["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
					["<C-e>"] = cmp.mapping.abort(), -- Abort completion
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection

					-- Use Tab and Shift-Tab for completion selection
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item() -- Select next completion item
						else
							fallback() -- If no completion menu, fallback to default Tab behavior
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item() -- Select previous completion item
						else
							fallback() -- If no completion menu, fallback to default Shift-Tab behavior
						end
					end, { "i", "s" }),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP completions
					{ name = "vsnip" }, -- Snippet completions
				}, {
					{ name = "buffer" }, -- Buffer completions
					{ name = "path" }, -- Path completions
				}),
			})

			-- Setup for specific filetypes
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "cmp_git" }, -- Git completions
				}, {
					{ name = "buffer" }, -- Buffer completions
				}),
			})

			-- Setup for command-line completion
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }, -- Buffer completions
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }, -- Path completions
				}, {
					{ name = "cmdline" }, -- Command-line completions
				}),
			})
		end,
	},
}
