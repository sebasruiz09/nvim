return {
  "declancm/cinnamon.nvim",
  config = function()
    require("cinnamon").setup({
      default_keymaps = true,
      extra_keymaps = false,
      extended_keymaps = true,
      override_keymaps = false,
      always_scroll = true,
      centered = true,
      disabled = false,
      default_delay = 7,
      hide_cursor = false,
      horizontal_scroll = true,
      max_length = -1,
      scroll_limit = 200,
    })
  end,
}
