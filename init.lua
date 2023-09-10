require("sebasruiz.config")
vim.opt.fillchars = {
	vert = "▕",
	fold = " ",
	eob = " ",
	diff = "╱",
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

vim.cmd("verbose 15")
vim.g.loaded_perl_provider = 0
vim.opt.clipboard:append { "unnamedplus" }

vim.opt.termguicolors = true

vim.notify = require("notify")
