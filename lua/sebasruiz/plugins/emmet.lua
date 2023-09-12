return {
	"mattn/emmet-vim",
	dependencies = {
		{ "AndrewRadev/tagalong.vim" }
	},
	config = function()
		vim.g.user_emmet_mode = 'n'
		vim.g.user_emmet_mode = 'inv'
		vim.g.user_emmet_mode = 'a',
				vim
		user_emmet_leader_key = '<C-,>'
	end
}
