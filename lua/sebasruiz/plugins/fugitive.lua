return {
  "tpope/vim-fugitive",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  event = "VimEnter",
  keys = {
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", mode = { "n" }, desc = "preview git hunk" },
    {
      "<leader>gv",
      "<cmd>Gvdiffsplit<cr>",
      mode = { "n" },
      desc = "view git diff",
    },
    {
      "<leader>gv",
      "<cmd>Git<cr>",
      mode = { "n", "v" },
      desc = "Git panel",
    },
  },
  config = function()
    require("gitsigns").setup()
  end,
}
