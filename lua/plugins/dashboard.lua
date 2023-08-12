return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        header = require('lua.art.art'),
        week_header = {
          enable = false
        },
        packages = { enable = false },
        footer = { '' },
      },
      hide = { statusline = false }
    }
    vim.g.indent_blankline_filetype_exclude = { 'dashboard' }
  end,
}
