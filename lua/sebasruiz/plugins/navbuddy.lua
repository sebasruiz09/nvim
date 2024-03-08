return {
  "neovim/nvim-lspconfig",
  keys = { {
    "nv",
    "<cmd>Navbuddy<cr>",
    mode = { "n" },
    desc = "Open Navbuddy toggle",
  } },
  dependencies = {
    {
      "SmiteshP/nvim-navbuddy",
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
}
