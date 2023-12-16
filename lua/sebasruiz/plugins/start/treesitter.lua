return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "HiPhish/nvim-ts-rainbow2",
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "luadoc", "python", "vim", "css", "scss", "json", "javascript", "typescript", "dart" },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow").strategy.global,
        hlgroups = {
          "TSRainbowRed",
          "TSRainbowGreen",
          "TSRainbowBlue",
          "TSRainbowYellow",
          "TSRainbowOrange",
          "TSRainbowViolet",
          "TSRainbowCyan",
        },
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          loookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["ai"] = "@function.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
    })
  end,
}
