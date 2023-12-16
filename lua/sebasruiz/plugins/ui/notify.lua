return {
  "rcarriga/nvim-notify",
  event = "VimEnter",
  config = function()
    require("notify").setup({
      fps = 60,
      stages = "fade_in_slide_out",
      timeout = 1500,
      render = "minimal",
      max_height = function()
        return math.floor(vim.o.lines * 0.30)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.35)
      end,
    })
  end,
}
