return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  config = function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    }
  end
}
