return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			dependencies = {
				"junegunn/fzf.vim",
				dependencies = {
					{ "tpope/vim-dispatch", cmd = { "Make", "Dispatch" } },
					{ "junegunn/fzf",       build = ":call fzf#install()" }
				}
			}
		}
	},
	config = function()
		local sorters = require('telescope.sorters')
		local actions = require "telescope.actions"

		require("telescope").load_extension "file_browser"
		require("telescope").setup {
			defaults = {
				mappings = {
					i = { ["<C-z>"] = actions.select_vertical },
					n = { ["<C-z>"] = actions.select_vertical }
				},
				layout_config = {
					width = 0.65,
					height = 0.65,
					prompt_position = "top",
					preview_cutoff = 120,

					vertical = { mirror = false }
				},
				find_command = {
					'rg', '--no-heading', '--with-filename', '--line-number',
					'--column', '--smart-case'
				},
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				file_sorter = sorters.get_fuzzy_file,
				file_ignore_patterns = {
					"node_modules/*", ".angular/*", ".git", ".vscode/*"
				},
			}
		}
	end
}
