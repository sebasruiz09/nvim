require "sebasruiz.config.options"
require "sebasruiz.config.keymaps"

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
  end,
})
require "sebasruiz.config.lazy"
