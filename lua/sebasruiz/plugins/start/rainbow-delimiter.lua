return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rainbow_delimiters = require 'rainbow-delimiters'
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			highlight = {
				'RainbowDelimiterViolet',
				'RainbowDelimiterBlue',
				'RainbowDelimiterYellow',
				'RainbowDelimiterCyan',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
			},
		}
	end
}
