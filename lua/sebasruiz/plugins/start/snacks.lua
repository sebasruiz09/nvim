return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      formats = { "png", "jpg", "jpeg", "webp", "gif", "bmp", "tiff" },
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 80,
        max_height = 40,
      },
    },

    bigfile = { enabled = true },

    picker = { enabled = true, title = "Files Finder", cwd = true },
    quickfile = {
      enabled = true,
    },
  },

  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },

    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>n",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
  },
}
