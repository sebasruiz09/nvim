return {
	"echasnovski/mini.indentscope",
	config = function()
		require('mini.indentscope').setup {
			draw = {
				delay = 30,
				priority = 5,
			},
			mappings = {
				object_scope = 'ii',
				object_scope_with_border = 'ai',
				goto_top = '[i',
				goto_bottom = ']i',
			},
			options = {
				border = 'both',
				indent_at_cursor = false,
				try_as_border = false,
			},
			symbol = '╎',
		}
	end
}
