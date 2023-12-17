local status_line_height = vim.api.nvim_win_get_height(0)
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {},
      format = {
        cmdline = { pattern = "^:", icon = "󰘳 ", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {},
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        position = {
          row = vim.fn.winheight(0) - status_line_height - 2,
          col = "1%",
        },
        size = {
          width = 30,
          height = 1,
        },
      },
    },
  },
}
