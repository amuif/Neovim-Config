return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets", -- optional
    },

    opts = {
      keymap = { preset = "default" },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },

    opts_extend = { "sources.default" },
  },

  -- Disable NVChad’s built-in nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
  },

  -- Disable other cmp-related plugins from NVChad
  {
    "hrsh7th/cmp-nvim-lsp",
    enabled = false,
  },
  {
    "hrsh7th/cmp-buffer",
    enabled = false,
  },
  {
    "hrsh7th/cmp-path",
    enabled = false,
  },
  {
    "L3MON4D3/LuaSnip",
    enabled = true, -- blink has built-in snippet support unless you want luasnip
  },
  }

