return {


	{
		"navarasu/onedark.nvim",
		lazy = false, -- Load the theme immediately
		priority = 1000, -- Load it before other plugins
		config = function()
			require("onedark").setup({
				-- Main options --
				style = "cool", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', and 'light'
				transparent = false, -- Show/hide background
				term_colors = true, -- Change terminal colors as per the theme style
				ending_tildes = false, -- Show end-of-buffer tildes
				cmp_itemkind_reverse = false, -- Reverse item kind highlights in cmp menu

				-- Toggle theme style --
				toggle_style_key = nil, -- Keybind to toggle theme style (set to "<leader>ts" or similar)
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },

				-- Code style --
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- Transparency for the center bar
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- Use darker colors for diagnostics
					undercurl = true, -- Use undercurl instead of underline for diagnostics
					background = true, -- Use background color for virtual text
				},
			})
			require("onedark").load()

			vim.cmd.colorscheme "onedark"
		end,
	},
}
