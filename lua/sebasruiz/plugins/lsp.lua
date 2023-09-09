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
		{ 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
	},
	opts = {
		servers = {
			tsserver = {},
			angularls = {},
			jsonls = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		},
	},
}
