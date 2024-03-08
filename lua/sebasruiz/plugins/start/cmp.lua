local icons = {
  Text = " ",
  Method = " ",
  Function = "󰊕 ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = "  ",
  Snippet = "  ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

return {
  "hrsh7th/nvim-cmp",
  event = "insertEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
        }),
      }),
      sources = cmp.config.sources(
        { {
          name = "nvim_lsp",
        }, {
          name = "luasnip",
        } },
        { {
          name = "buffer",
        } }
      ),
      formatting = {
        fields = { "abbr", "kind" },
        format = function(entry, vim_item)
          vim_item.kind = icons[vim_item.kind] .. vim_item.kind

          return vim_item
        end,
      },
    })
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({ {
        name = "cmp_git",
      } }, { {
        name = "buffer",
      } }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { {
        name = "buffer",
      } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ {
        name = "path",
      } }, { {
        name = "cmdline",
      } }),
    })

    local devicons = require("nvim-web-devicons")
    cmp.register_source("devicons", {
      complete = function(_, _, callback)
        local items = {}
        for _, icon in pairs(devicons.get_icons()) do
          table.insert(items, {
            label = icon.icon .. "  " .. icon.name,
            insertText = icon.icon,
            filterText = icon.name,
          })
        end
        callback({
          items = items,
        })
      end,
    })

    local lspconfig = require("lspconfig")
    local servers = require("mason-lspconfig").get_installed_servers()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, server in pairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
    vim.o.completeopt = "menu,menuone,noselect"
  end,
}
