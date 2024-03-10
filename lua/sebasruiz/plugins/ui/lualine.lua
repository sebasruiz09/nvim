local icons = {
  git = {
    added = " ",
    modified = " ",
    removed = "󰆴 ",
  },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "EdenEast/nightfox.nvim",
  },
  lazy = true,
  event = "InsertEnter",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nightfox",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = " " },
        disabled_filetypes = {
          statusline = { "dashboard" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = vim.go.laststatus == 3,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          function()
            return " "
          end,
        },
        lualine_c = {
          "branch",
          "diagnostics",
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
          },
          "filename",
          "filetype",
          "fileformat",
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { "location", separator = " ", padding = { left = 0, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {
          "location",
        },
        lualine_y = {},
        lualine_z = { "progress" },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "lazy" },
    })
  end,
}
