return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>lw",
      function()
        require("spectre").open_visual()
      end,
      mode = { "n" },
      desc = "Search current word",
    },
    {
      "<leader>ll",
      function()
        require("spectre").open_visual()
      end,
      mode = { "n", "v" },
      desc = "Search on current file",
    },
  },
  config = function()
    require("spectre").setup({
      color_devicons = true,
      open_cmd = "vnew",
      live_update = true,
      line_sep_start = "┌-----------------------------------------",
      result_padding = "¦  ",
      line_sep = "└-----------------------------------------",
      highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete",
      },
    })
  end,
}
