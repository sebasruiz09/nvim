return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'p00f/nvim-ts-rainbow'
	},
	build = ':TSUpdate',
	event = "VeryLazy",
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = { 'lua', 'luadoc', 'python', 'css', 'scss', 'tsx', 'json', 'javascript', 'typescript',
				'vimdoc', 'vim' },
			sync_install = false,
			ignore_install = {},
			auto_install = true,
			highlight = {
				enable = true,
				use_languagetree = true,
				additional_vim_regex_highlighting = true
			},
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					loookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["ai"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<c-space>',
					node_incremental = '<c-space>',
					scope_incremental = '<c-s>',
					node_decremental = '<M-space>',
				},
			},
		}
	end
}
