require "user.options"
require "user.plugins"
require "settings.keymaps"
require "user.colorschema"
require "plugins.neo-tree"
require "plugins.lualine"
require "plugins.mason"
require "plugins.telescope.telescope"
require "plugins.nvim-web-devicons"
require "plugins.tabby"
require "plugins.nvim-cmp"

vim.lsp.set_log_level("debug")

  vim.opt.fillchars = { 
    vert = "▕", -- alternatives │
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
  }

vim.opt.guifont = { "JetBrains Mono", "h12" }
