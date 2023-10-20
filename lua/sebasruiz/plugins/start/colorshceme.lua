return {
	"navarasu/onedark.nvim",
	dependencies = {
		{ "rose-pine/neovim",      name = 'rose-pine' },
		{ "rebelot/kanagawa.nvim" },
		{ "EdenEast/nightfox.nvim" },
	},
	lazy = false,   -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require('rose-pine').setup({
			disable_italics = true,
		})
		vim.cmd([[colorscheme nightfox]])
	end,
}
