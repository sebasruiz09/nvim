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
  Keyword = " ",
  Snippet = " ",
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

  event = {
    "InsertEnter",
    "CmdlineEnter",
  },

  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",

    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      config = true,
    },
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local types = require("cmp.types")

    local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

    local PAD = " "

    vim.api.nvim_create_autocmd({
      "BufEnter",
      "InsertEnter",
    }, {
      group = vim.api.nvim_create_augroup("SebasCmpBuffer", { clear = true }),

      callback = function(args)
        local buftype = vim.bo[args.buf].buftype
        local filetype = vim.bo[args.buf].filetype

        local disabled_filetypes = {
          TelescopePrompt = true,
          snacks_picker_input = true,
          snacks_picker_list = true,
          snacks_picker_preview = true,
          snacks_dashboard = true,
          lazy = true,
        }

        cmp.setup.buffer({
          enabled = buftype ~= "prompt" and buftype ~= "terminal" and not disabled_filetypes[filetype],
        })
      end,
    })

    pcall(vim.api.nvim_del_user_command, "CmpToggle")

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

      cmp.setup.buffer({
        enabled = not enabled,
      })

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
        fields = {
          "abbr",
          "kind",
          "menu",
        },

        format = function(entry, vim_item)
          local kind = vim_item.kind
          local icon = icons[kind] or ""

          -- Sugerencia a la izquierda.
          vim_item.abbr = PAD .. vim_item.abbr

          -- Icono y tipo a la derecha.
          vim_item.kind = icon .. kind .. PAD

          -- Ocultar [LSP], [Buffer], etc.
          vim_item.menu = ""

          -- Colores Tailwind.
          vim_item = tailwind_formatter(entry, vim_item)

          if vim_item.kind_hl_group and kind == "Color" then
            vim_item.kind = "● Color "
          end

          return vim_item
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Select,
        }),

        ["<Down>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Select,
        }),

        ["<C-k>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),

        ["<C-j>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({
              behavior = cmp.SelectBehavior.Select,
            })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({
              behavior = cmp.SelectBehavior.Select,
            })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        ["<CR>"] = cmp.mapping.confirm({
          select = true,
        }),

        ["<Esc>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()

            vim.schedule(function()
              local ok, suggestion = pcall(require, "copilot.suggestion")

              if ok then
                suggestion.update_preview()
              end
            end)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
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

      experimental = {
        ghost_text = false,
      },

      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          priority = 1000,
        },
        {
          name = "luasnip",
          priority = 750,
        },
        {
          name = "buffer",
          priority = 500,
        },
        {
          name = "path",
          priority = 250,
        },
      }),

      window = {
        completion = cmp.config.window.bordered({
          border = {
            "┌",
            "─",
            "┐",
            "│",
            "┘",
            "─",
            "└",
            "│",
          },

          winhighlight = table.concat({
            "Normal:CmpPmenu",
            "FloatBorder:CmpBorder",
            "CursorLine:CmpSelection",
            "Search:None",
          }, ","),
        }),

        documentation = cmp.config.window.bordered({
          border = {
            "┌",
            "─",
            "┐",
            "│",
            "┘",
            "─",
            "└",
            "│",
          },

          winhighlight = table.concat({
            "Normal:CmpDoc",
            "FloatBorder:CmpDocBorder",
          }, ","),
        }),
      },

      enabled = function()
        local disabled_filetypes = {
          TelescopePrompt = true,
          snacks_picker_input = true,
          snacks_picker_list = true,
          snacks_picker_preview = true,
          snacks_dashboard = true,
          lazy = true,
        }

        if vim.bo.buftype == "prompt" or vim.bo.buftype == "terminal" then
          return false
        end

        return not disabled_filetypes[vim.bo.filetype]
      end,
    })

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false

      vim.schedule(function()
        local ok, suggestion = pcall(require, "copilot.suggestion")

        if ok then
          suggestion.update_preview()
        end
      end)
    end)

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        {
          name = "cmp_git",
        },
      }, {
        {
          name = "buffer",
        },
      }),
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        {
          name = "cmp_git",
        },
      }, {
        {
          name = "buffer",
        },
      }),
    })

    cmp.setup.cmdline({
      "/",
      "?",
    }, {
      mapping = cmp.mapping.preset.cmdline(),

      sources = {
        {
          name = "buffer",
        },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),

      sources = cmp.config.sources({
        {
          name = "path",
        },
      }, {
        {
          name = "cmdline",
        },
      }),
    })

    vim.o.completeopt = "menu,menuone,noselect"

    vim.api.nvim_set_hl(0, "CmpPmenu", {
      link = "Pmenu",
    })

    vim.api.nvim_set_hl(0, "CmpBorder", {
      link = "FloatBorder",
    })

    vim.api.nvim_set_hl(0, "CmpDoc", {
      link = "NormalFloat",
    })

    vim.api.nvim_set_hl(0, "CmpDocBorder", {
      link = "FloatBorder",
    })

    vim.api.nvim_set_hl(0, "CmpSelection", {
      bg = "#5E677A",
      fg = "NONE",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "PmenuSel", {
      bg = "#5E677A",
      fg = "NONE",
      bold = true,
    })
  end,
}
