return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = function()
		require('spectre').setup({

			color_devicons = true,
			open_cmd       = 'vnew',
			live_update    = false, -- auto execute search again when you write to any file in vim
			line_sep_start = '┌-----------------------------------------',
			result_padding = '¦  ',
			line_sep       = '└-----------------------------------------',
			highlight      = {
				ui = "String",
				search = "DiffChange",
				replace = "DiffDelete"
			},
		})
	end
}
