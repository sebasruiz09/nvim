local theme = {
  fill = { bg = "#131a24" },
  head = { fg = "#019833", bg = "#192330", style = "italic" },
  current_tab = { fg = "#ffffff", bg = "#192330", style = "italic" },
  tab = { fg = "#f2e9de", bg = "#131a24", style = "Bold" },
  win = { fg = "#f2e9de", bg = "#131a24", style = "Bold" },
  tail = { fg = "#d0ff00", bg = "#192330" },
}

return {
  "nanozuki/tabby.nvim",
  event = { "BufReadPre", "VimEnter" },
  keys = {
    {
      "<leader>ta",
      "<cmd>$tabnew<cr>",
      mode = { "n" },
      desc = "new tab",
    },
    {
      "<leader>tc",
      "<cmd>tabclose<cr>",
      mode = { "n" },
      desc = "close tab",
    },
    {
      "<leader>to",
      "<cmd>tabonly<cr>",
      mode = { "n" },
      desc = "tab only",
    },
    {
      "<leader>gt",
      "<cmd>tabn<cr>",
      mode = { "n" },
      desc = "next tab",
    },
    {
      "<leader>tg",
      "<cmd>tabp<cr>",
      mode = { "n" },
      desc = "previus tab",
    },
    {
      "<leader>tmp",
      "<cmd>-tabmove<cr>",
      mode = { "n" },
      desc = "tab move -1",
    },
    {
      "<leader>tmn",
      "<cmd>+tabmove<cr>",
      mode = { "n" },
      desc = "tab move +1",
    },
  },
  config = function()
    require("tabby.tabline").set(function(line)
      return {
        {
          { "  ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep("", hl, theme.fill),
            tab.name(),
            tab.is_current() and " " or "󰒲",
            line.sep("", hl, theme.fill),
            hl = hl,
            margin = " ",
          }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep("", theme.win, theme.fill),
            win.file_icon(),
            line.sep("", theme.win, theme.fill),
            hl = theme.win,
            margin = " ",
          }
        end),
        {
          line.sep("", theme.tail, theme.fill),
          { "   ", hl = theme.tail },
        },
        hl = theme.fill,
      }
    end)
  end,
}
