return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
     ]]

    logo = string.rep("\n", 8) .. logo .. "\n"

    local opts = {
      theme = "doom",
      hide = {
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = vim.split(logo, "\n"),
				-- stylua: ignore
				center = {
					{ action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
					{ action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
					{ action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
					{ action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
					{ action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
					{ action = "Oil --float", desc = " Oil", icon = "󰐅 ", key = "o" },
					{ action = "qa", desc = " Quit", icon = " ", key = "q" },
				},
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "",
            "󱑶  Free software is like sex, it's better when it's free",
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end
    return opts
  end,
}
