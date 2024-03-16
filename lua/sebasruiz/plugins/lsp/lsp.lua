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
    ensure_installed = { "lua_ls", "tsserver", "angularls", "jsonls", "html", "css_ls" },
    automatic_installation = true,
    servers = {
      tsserver = {},
      angularls = {},
      jsonls = {},
      jq = {},
      html = {},
      bashls = {},
      cssls = {},
      cssmodules_ls = {},
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
