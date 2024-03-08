return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>t", "<cmd>Trouble<cr>", mode = { "n" }, desc = "Open trouble" },
    {
      "<leader>tt",
      "<cmd>TroubleClose<cr>",
      mode = { "n" },
      desc = "Close trouble",
    },
  },
  opts = {},
}
