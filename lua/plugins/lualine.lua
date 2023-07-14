return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('lualine').setup()
    end,
}

