return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 30,
				debounce_delay = 0,
			},
			renderer = {
				group_empty = false,
				root_folder_label = false,
				indent_markers = {
					enable = true
				},
				highlight_opened_files = "all",
			},
			filters = {
				dotfiles = false,
			}
		})
		vim.g.loader_netrw = 1
		vim.g.loader_netrwPlugin = 1
	end
}
