return {
  "tpope/vim-fugitive",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  event = "VimEnter",
  keys = {
    { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", mode = { "n" }, desc = "preview git hunk" },
    {
      "<leader>gs",
      "<cmd>Gvdiffsplit<cr>",
      mode = { "n" },
      desc = "view git diff",
    },
    {
      "<leader>gg",
      "<cmd>vertical Git<cr>",
      mode = { "n", "v" },
      desc = "Git panel",
    },
		{
			"<leader>gp",
			"<cmd>Git push<cr>",
			mode = { "n"},
			desc = "Git push"
		}
  },
  config = function()
    require("gitsigns").setup()
  end,
}
