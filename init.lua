vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- diagnostic underline
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
  underdouble = true,
  sp = "#ff5555", -- underline color
})

--------------------------------------------------------------------------------
-- Memory Watcher
--------------------------------------------------------------------------------

-- thresholds (MB)
local NVIM_THRESHOLD_MB = 500
local LSP_THRESHOLD_MB = 1000

-- get memory usage of a process by PID (Windows: tasklist)
local function get_process_mem(pid)
  local handle = io.popen('tasklist /FI "PID eq ' .. pid .. '" /FO CSV /NH')
  if not handle then
    return 0
  end
  local output = handle:read "*a" or ""
  handle:close()

  -- Match memory column (e.g. "123,456 K")
  local mem = output:match ',"([%d,]+) K"'
  if not mem then
    return 0
  end

  mem = mem:gsub(",", "")
  return tonumber(mem) or 0 -- KB
end

-- check Neovim + LSP memory
local function check_mem()
  local report = {}

  -- Neovim itself
  local nvim_mem_kb = get_process_mem(vim.fn.getpid())
  local nvim_mem_mb = nvim_mem_kb / 1024
  table.insert(report, "Neovim: " .. string.format("%.1f MB", nvim_mem_mb))

  -- LSP clients
  for _, client in pairs(vim.lsp.get_clients()) do
    ---@diagnostic disable-next-line: undefined-field
    local pid = client.rpc and client.rpc.pid
    if pid then
      local mem_kb = get_process_mem(pid)
      local mem_mb = mem_kb / 1024
      table.insert(report, client.name .. ": " .. string.format("%.1f MB", mem_mb))

      if mem_mb > LSP_THRESHOLD_MB then
        vim.notify(
          "💀 Stopping LSP '"
            .. client.name
            .. "' (RAM: "
            .. math.floor(mem_mb)
            .. " MB > "
            .. LSP_THRESHOLD_MB
            .. " MB)",
          vim.log.levels.ERROR
        )
        client:stop() -- correct API call
      end
    end
  end

  -- Neovim threshold warning
  if nvim_mem_mb > NVIM_THRESHOLD_MB then
    vim.notify("⚠️ High Neovim memory usage!\n" .. table.concat(report, "\n"), vim.log.levels.WARN)
  end

  -- reschedule every 60s
  vim.defer_fn(check_mem, 60000)
end

-- start monitoring after 60s
vim.defer_fn(check_mem, 60000)
