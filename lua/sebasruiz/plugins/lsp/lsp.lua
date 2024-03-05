return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        automatic_installation = true,
      },
    },
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
  },
  opts = {
    servers = {
      tsserver = {},
      angularls = {},
      jsonls = {},
      html_lsp = {},
      css_lsp = {},
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
  },
  config = function() end,
}
