return {
  "akinsho/bufferline.nvim",
  version = "*",
  config = function()
    require("bufferline").setup({
      options = {
        --separator_style = "slope",
        move_wraps_at_ends = true,
        show_tab_indicator = true,
        show_close_icon = false,
        show_buffer_close_icon = false,
        diagnostics = "nvim_lsp",
        color_icons = true,
        buffer_close_icon = "",
      },
    })
  end,
}
