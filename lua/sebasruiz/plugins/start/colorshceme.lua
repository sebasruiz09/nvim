return {
  "EdenEast/nightfox.nvim",
  dependencies = {
    "tiagovla/tokyodark.nvim",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  },
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
