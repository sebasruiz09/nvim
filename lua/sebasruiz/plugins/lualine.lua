return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    require('lualine').setup {
      disabled_filetypes = { 'NvimTree' }
    }
  end,
}
