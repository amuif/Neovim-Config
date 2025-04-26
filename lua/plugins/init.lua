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
        "emmet_language_server",
        "gofumpt",
        "golines",
        "black",
        "mypy",
      },
    },
  },
  -- to make a great ui
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
    require("lspsaga").setup({
  lightbulb = {
    enable = false,  -- disables the bulb icon
  },
  symbol_in_winbar = {
    enable = false,  -- disables the breadcrumb in the winbar
  },
  ui = {
    -- Define how the saga icons should look
    theme = "round",
    -- Customize border for floating windows
    border = "rounded",
    -- Show lines for hover window
    winblend = 0,
    expand = "",
    collapse = "",
  },

  code_action = {
    enable = true,
    keys = {
      -- Mapping to trigger code actions
      quit = "q",
      exec = "<CR>",  -- Enter key to execute the action
    },
  },
  rename = {
    enable = true,
    keys = {
      quit = "<Esc>",  -- Mapping to exit the rename prompt
      exec = "<CR>",   -- Enter key to apply the rename
    },
  },
  diagnostic = {
    enable = true,
    keys = {
      -- Mapping to jump to next/prev diagnostic
      next = "n",
      prev = "p",
    },
  },
})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
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
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "tpope/vim-fugitive",
      "folke/trouble.nvim",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    end,
  },
}
