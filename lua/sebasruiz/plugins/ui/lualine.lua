local function vimIcon()
  return " "
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "EdenEast/nightfox.nvim",
  },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "nightfox",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = " " },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
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
        lualine_b = { vimIcon },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = {
          "filename",
          "filetype",
          "fileformat",
          "progress",
        },
        lualine_y = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
