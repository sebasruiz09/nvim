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
  Snippet = "  ",
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
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },

  config = function()
    local cmp = require("cmp")
    local types = require("cmp.types")
    local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter
    local PAD = " "

    vim.api.nvim_create_autocmd({ "BufEnter", "InsertEnter" }, {
      callback = function()
        pcall(function()
          require("cmp").setup.buffer({ enabled = true })
        end)
      end,
    })

    vim.api.nvim_create_user_command("CmpToggle", function()
      local ok, state = pcall(function()
        return require("cmp.config").get().enabled
      end)
      local enabled = true
      if ok then
        if type(state) == "function" then
          enabled = state()
        else
          enabled = state
        end
      end
      require("cmp").setup.buffer({ enabled = not enabled })
      print("cmp " .. (not enabled and "ENABLED" or "DISABLED") .. " for this buffer")
    end, {})

    cmp.setup({
      completion = {
        autocomplete = {
          types.cmp.TriggerEvent.TextChanged,
          types.cmp.TriggerEvent.InsertEnter,
        },
      },

      formatting = {
        format = function(entry, vim_item)
          local kind = vim_item.kind
          local icon = icons[kind] or ""
          vim_item.kind = " " .. icon .. " "
          vim_item = tailwind_formatter(entry, vim_item)
          if vim_item.kind_hl_group and kind == "Color" then
            vim_item.kind = " ● "
          end
          vim_item.abbr = PAD .. vim_item.abbr .. PAD
          if vim_item.menu and vim_item.menu ~= "" then
            vim_item.menu = PAD .. vim_item.menu .. PAD
          end
          return vim_item
        end,
        fields = { "kind", "abbr", "menu" },
      },

      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.offset,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

      experimental = { ghost_text = false },

      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }),

      window = {
        completion = cmp.config.window.bordered({
          border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        }),
        documentation = cmp.config.window.bordered({
          border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
        }),
      },

      enabled = function()
        if vim.bo.buftype == "prompt" or vim.bo.buftype == "terminal" then
          return false
        end
        return true
      end,
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({ { name = "cmp_git" } }, { { name = "buffer" } }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    vim.o.completeopt = "menu,menuone,noselect"
  end,
}
