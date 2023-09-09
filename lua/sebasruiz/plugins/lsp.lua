return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim', config = true },
		{
			'williamboman/mason-lspconfig.nvim',
			opts = {
				automatic_installation = true,
			}
		},
		'folke/neodev.nvim',
		"simrat39/rust-tools.nvim",
	},
	opts = {
		servers = {
			tsserver = {},
			angularls = {},
			luals = {},
			jsonls = {},
		},
	},
}
