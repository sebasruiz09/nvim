return {
  "stevearc/oil.nvim",
  opts = {
    default_file_exporer = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 2,
      max_width = 170,
      max_height = 35,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      override = function(conf)
        return conf
      end,
    },
  },
}
