return {
  "stevearc/oil.nvim",
  event = "VimEnter",
  keys = {
    { "<leader>e", "<cmd>Oil --float<cr>", mode = { "n" }, desc = "File explorer" },
  },
  opts = {
    default_file_exporer = true,
    view_options = {
      show_hidden = true,
    },
		columns = {
        "icon",
				 --"mtime",
				 --"size",
      },
    float = {
      padding = 2,
      max_width = 155,
      max_height = 32,
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
