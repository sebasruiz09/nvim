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
  keys = {
    {
      "<leader>ac",
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      mode = {
        "n",
        "v",
      },
      desc = "Lsp code actions",
    },
    {
      "<leader>vn",
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      mode = {
        "n",
        "v",
      },
      desc = "Goes to next diagnostic",
    },
    {
      "<leader>vp",
      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
      mode = {
        "n",
        "v",
      },
      desc = "Goes to prev diagnostic",
    },
    {
      "gd",
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      mode = {
        "n",
        "v",
      },
      desc = "Goes to definition",
    },
    {
      "K",
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      mode = {
        "n",
      },
      desc = "Preview definition docs",
    },
    {
      "<C-p",
      "<cmd>lua vim.lsp.buf.signature_help()<CR>",
      mode = {
        "i",
      },
      desc = "Preview signature help on insert mode",
    },
    {
      "<leader>rr",
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      mode = {
        "n",
      },
      desc = "Rename definition with LSP",
    },
  },

  opts = {
    ensure_installed = { "lua_ls", "tsserver", "angularls", "jsonls", "html", "css_ls", "pyright", "omnisharp" },
    automatic_installation = true,
    servers = {
      omnisharp = {},
      tsserver = {},
      angularls = {
        cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations",
          "",
          "--ngProbeLocations",
          "",
        },
        on_new_config = function(new_config, _)
          new_config.cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            "",
            "--ngProbeLocations",
            "",
          }
        end,
        root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
        filetypes = { "typescript", "html" },
      },
      jsonls = {},
      pyright = {
        single_file_support = true,
        filetypes = { "python" },
      },
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
