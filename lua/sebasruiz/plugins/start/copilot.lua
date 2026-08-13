return {
  "zbirenbaum/copilot.lua",

  cmd = "Copilot",
  event = "InsertEnter",

  opts = {
    copilot_node_command = "/home/sebas/.nvm/versions/node/v22.23.2/bin/node",

    panel = {
      enabled = true,
      auto_refresh = true,

      layout = {
        position = "right",
        ratio = 0.35,
      },
    },

    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,

      keymap = {
        accept = false,
        accept_word = false,
        accept_line = false,
        next = false,
        prev = false,
        dismiss = false,
      },
    },

    filetypes = {
      markdown = true,
      gitcommit = true,
      yaml = true,
      help = false,
      gitrebase = false,
      ["."] = false,
    },
  },
  keys = {
    {
      "<leader>as",
      function()
        require("copilot.suggestion").accept()
      end,
      mode = "i",
      desc = "Accept Copilot Suggestion",
    },
    {
      "<leader>dc",
      function()
        require("copilot.suggestion").dismiss()
      end,
      mode = "i",
      desc = "Decline Copilot Suggestion",
    },
    {
      "<leader>an",
      function()
        require("copilot.suggestion").next()
      end,
      mode = "i",
      desc = "Next Copilot Suggestion",
    },
    {
      "<leader>ap",
      function()
        require("copilot.suggestion").prev()
      end,
      mode = "i",
      desc = "Previous Copilot Suggestion",
    },
    {
      "<leader>av",
      "<cmd>Copilot panel<cr>",
      desc = "Copilot Suggestions Panel",
    },
    {
      "<leader>at",
      "<cmd>Copilot status<cr>",
      desc = "Copilot Status",
    },
  },
}
