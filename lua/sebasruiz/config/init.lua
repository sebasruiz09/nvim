require("sebasruiz.config.settings")
require("sebasruiz.config.options")

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("SebasVeryLazy", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
    require("sebasruiz.config.diagnostics")
    require("sebasruiz.config.keymaps")
  end,
})

require("sebasruiz.config.lazy")
require("sebasruiz.config.reload")
