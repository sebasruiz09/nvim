return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      formats = { "png", "jpg", "jpeg", "webp", "gif", "bmp", "tiff", "ico" },
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 80,
        max_height = 40,
      },
    },

    bigfile = { enabled = true },

    picker = {
      enabled = true,
      title = "Files Finder",
      cwd = true,
    },
    quickfile = {
      enabled = true,
    },

    git = {
      enabled = true,
    },

    lazygit = {
      enabled = true,
    },
    terminal = {
      enabled = true,
      opts = {
        layout = {
          width = 1.0,
          height = 1.0,
          border = "none",
        },
        on_open = function()
          vim.cmd("stopinsert")
        end,
        bo = {
          filetype = "snacks_terminal",
        },
        wo = {},
        keys = {
          q = "hide",
          gf = function(self)
            local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
            if f == "" then
              Snacks.notify.warn("No file under cursor")
            else
              self:hide()
              vim.schedule(function()
                vim.cmd("e " .. f)
              end)
            end
          end,
          term_normal = {
            "<esc>",
            function(self)
              self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
              if self.esc_timer:is_active() then
                self.esc_timer:stop()
                vim.cmd("stopinsert")
              else
                self.esc_timer:start(200, 0, function() end)
                return "<esc>"
              end
            end,
            mode = "t",
            expr = true,
            desc = "Double escape to normal mode",
          },
        },
      },
    },
  },

  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files({
          formatters = {
            file = {
              truncate = 15,
            },
          },
          layout = {
            layout = {
              box = "horizontal",
              width = 0.6,
              height = 0.7,
              {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "input", height = 2, border = "none" },
                { win = "list", border = "none" },
              },
              { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
            },
          },
        })
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

    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "lazygit",
    },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
  },
  enabled = true,
}
