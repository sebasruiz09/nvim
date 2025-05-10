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

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "s", "<Plug>Lightspeed_s", opts)
    vim.keymap.set("n", "S", "<Plug>Lightspeed_S", opts)

    vim.keymap.set("x", "s", "<Plug>Lightspeed_s", opts)
    vim.keymap.set("x", "S", "<Plug>Lightspeed_S", opts)
  end,
}
