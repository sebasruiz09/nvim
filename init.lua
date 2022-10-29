require "user.options"
require "user.plugins"
require "settings.keymaps"
require "user.colorschema"
require "plugins.neo-tree"
require "plugins.lualine"
require "plugins.lsp"
require "plugins.telescope.telescope"

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
