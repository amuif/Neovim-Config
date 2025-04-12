return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { -- Add friendly-snippets as a dependency here
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Add this to your LuaSnip config
      require("luasnip").filetype_extend("php", { "html", "javascript" })
      require("luasnip").filetype_extend("blade", { "html", "javascript" })
    end,
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.g.emmet_filetypes = {
        -- Add php explicitly for better compatibility
        "html",
        "php",
        "blade",
        "javascriptreact",
        "typescriptreact",
      }
      vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>(emmet-expand-abbr)", { noremap = false })
    end,
  },
  {
    "jwalton512/vim-blade",
    ft = { "blade" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "gopls",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "astro-language-server",
        "phpactor",
        "intelephense",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "HTML" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    auto_install = true,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "astro",
        "php",
      },
    },
  },
}
