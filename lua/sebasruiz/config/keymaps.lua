local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- telescope
keymap("n", "<C-p>", ":Telescope<CR>", opts)
keymap("n", "<C-b>", ":Telescope file_browser<CR>", opts)
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)

keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)

keymap("n", "nv", ":Navbuddy<CR>", opts)

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- spectre
keymap("n", "<leader>l", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})

keymap("n", "<leader>e", ":Oil --float<CR>", {
  desc = "Oil explorer",
})

-- trouble
keymap("n", "<leader>t", ":Trouble<CR>", opts)
keymap("n", "<leader>tt", ":TroubleClose<CR>", opts)

--resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- tabby
keymap("n", "<leader>ta", ":$tabnew<CR>", opts)
keymap("n", "<leader>tc", ":tabclose<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)
keymap("n", "<leader>gt", ":tabn<CR>", opts)
keymap("n", "<leader>tg", ":tabp<CR>", opts)
keymap("n", "<leader>tmp", ":-tabmove<CR>", opts)
keymap("n", "<leader>tmn", ":+tabmove<CR>", opts)

keymap("n", "<leader>rr", "<Plug>RestNvim", opts)

-- term exit
keymap("t", "<C-l>", "<C-\\><C-n>", opts)

--buffers navigation
keymap("n", "<leader>bd", ":bd!<CR>", opts)

keymap("t", "<C-Del>", "<C-\\><C-n>", opts)
