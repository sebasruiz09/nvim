return {
  "rmagatti/goto-preview",
  keys = {
    {
      "gp",
      function()
        require("goto-preview").goto_preview_definition()
      end,
      mode = { "n" },
      desc = "Open preview file in reference",
    },
    {
      "gP",
      function()
        require("goto-preview").close_all_win()
      end,
      mode = { "n" },
      desc = "Close all reference preview",
    },
  },
  config = function()
    require("goto-preview").setup({
      width = 120,
      height = 20,
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
      default_mappings = false,
      debug = false,
      opacity = nil,
      resizing_mappings = false,
      post_open_hook = nil,
      post_close_hook = nil,
      references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      },
      focus_on_open = true,
      dismiss_on_move = false,
      force_close = true,
      bufhidden = "wipe",
      stack_floating_preview_windows = true,
      preview_window_title = { enable = false, position = "left" },
    })
  end,
}
