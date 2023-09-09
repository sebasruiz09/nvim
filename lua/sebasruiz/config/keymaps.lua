local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- lightspeed
keymap('n', '<leader>s', '<Plug>Lightspeed_s', opts)

-- telescope
keymap('n', '<C-p>', ':Telescope<CR>', opts)
keymap('n', '<C-b>', ':Telescope file_browser<CR>', opts)
keymap('n', '<C-f>', ':Telescope find_files<CR>', opts)

-- terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
keymap('n', 'nv', ':Navbuddy<CR>', opts)


--toggle terms
keymap('n', '<C-t>', ':ToggleTerm<CR>', opts)

-- spectre
keymap('n', '<leader>l', '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre"
})

keymap('v', '<leader>lw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word"
})

keymap('n', '<leader>ll', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file"
})

--resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- nvimTree
keymap("n", "<leader>b", ':NvimTreeOpen<CR>', opts)
keymap("n", "<leader>bb", ':NvimTreeClose<CR>', opts)

--buffers navigation
keymap("n", "gt", ":TablineBufferNext<CR>", opts)
