require "config"
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

vim.cmd("verbose 15")
vim.g.loaded_perl_provider = 0
vim.opt.clipboard:append { "unnamedplus" }
vim.g.loader_netrw = 1
vim.g.loader_netrwPlugin = 1
vim.opt.termguicolors = true
