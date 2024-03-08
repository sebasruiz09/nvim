return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      dependencies = {
        "junegunn/fzf.vim",
        dependencies = {
          { "tpope/vim-dispatch", cmd = { "Make", "Dispatch" } },
          { "junegunn/fzf", build = ":call fzf#install()" },
        },
      },
    },
  },
  keys = {
    { "<C-p>", "<cmd>Telescope<cr>", mode = { "n" }, desc = "Telescope menu" },
    { "<C-b>", "<cmd>Telescope file_browser<cr>", mode = { "n" }, desc = "Telescope file browser" },
    { "<C-f>", "<cmd>Telescope find_files<cr>", mode = { "n" }, desc = "Telescope find files" },
  },
  config = function()
    local sorters = require("telescope.sorters")
    local actions = require("telescope.actions")

    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("notify")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = { ["<C-z>"] = actions.select_vertical },
          n = { ["<C-z>"] = actions.select_vertical },
        },
        border = true,
        borderchars = { " ", "", " ", " ", " ", " ", " ", " " },
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        path_display = { "smart" },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.57,
          },
          vertical = {
            mirror = false,
          },
          width = 0.60,
          height = 0.70,
          preview_cutoff = 120,
        },
        find_command = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = "  ",
        color_devicons = true,
        initial_mode = "insert",
        selection_strategy = "reset",
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = {
          "node_modules/*",
          ".angular/*",
          ".git",
          ".vscode/*",
        },
      },
    })
  end,
}
