return {
  "backdround/global-note.nvim",
  keys = {
    {
      "<leader>gn",
      function()
        require("global-note").toggle_note()
      end,
      mode = { "n" },
      desc = "Open global Toggle note",
    },
  },
  config = function()
    require("global-note").setup({
      filename = "global.md",
      title = " To do task ",
      directory = "~/Utils/notes",
      window_config = function()
        local window_height = vim.api.nvim_list_uis()[1].height
        local window_width = vim.api.nvim_list_uis()[1].width
        return {
          relative = "editor",
          border = "single",
          title_pos = "center",
          width = math.floor(0.45 * window_width),
          height = math.floor(0.55 * window_height),
          row = math.floor((0.40 * window_height) / 2),
          col = math.floor((0.55 * window_width) / 2),
        }
      end,
    })
  end,
}
