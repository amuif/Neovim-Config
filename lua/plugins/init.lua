return {
  {
    "stevearc/conform.nvim",
    --event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("php", { "html", "javascript" })
      require("luasnip").filetype_extend("blade", { "html", "javascript" })
    end,
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.g.emmet_filetypes = {
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
        "gofmt",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "astro-language-server",
        "intelephense",
        "emmet_language_server",
        "gofumpt",
        "golines",
        "black",
        "mypy",
        "taplo",
        "htmlbeautifier",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = false,
      },
    },
  },
  -- for code actions
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false, -- disables the breadcrumb in the winbar
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
            exec = "<CR>", -- Enter key to execute the action
          },
        },
        rename = {
          enable = true,
          keys = {
            quit = "<Esc>", -- Mapping to exit the rename prompt
            exec = "<CR>", -- Enter key to apply the rename
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
      }
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
  -- used for moving up and down
 {
    'kobbikobb/move-lines.nvim',
    config = function()
     require('move-lines').setup({
    move_down = '<C-J>', -- Custom key for moving lines down
    move_up = '<C-K>',   -- Custom key for moving lines up
    move_left = '<C-H>', -- Custom key for moving lines left
    move_right = '<C-L>' -- Custom key for moving lines right
})
    end,
} , {
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
  --themes
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    config = function()
      require("github-theme").setup {
        options = {
          -- Add your settings here
        },
      }
      vim.cmd "colorscheme github_dark" -- you can change to github_dimmed, etc
    end,
  },
  -- to beautify the terminal the command
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  --nice scrolling animation
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
  --linitng the code
  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "pylint" }, -- or "flake8" or "mypy" if preferred
        php = { "php" }, -- assumes `php -l` is used
        go = { "golangci_lint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  --database
   {
    "tpope/vim-dadbod",
    opt = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    opt = true,
    after = "vim-dadbod", -- Load after vim-dadbod
  },
  --lazygit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }}

  --snacks nvim
 , {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type table
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
}
