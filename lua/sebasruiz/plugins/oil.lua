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
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        update_on_cursor_moved = true,
      },
      override = function(conf)
        return conf
      end,
    },
  },
}
