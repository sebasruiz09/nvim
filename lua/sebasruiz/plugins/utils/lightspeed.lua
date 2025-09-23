return {
  "ggandor/lightspeed.nvim",
  event = "VeryLazy",
  opts = {
    ignore_case = true,
  },
  config = function()
    require("lightspeed").setup({
      ignore_case = true,
    })
  end,
}
