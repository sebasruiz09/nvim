local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("t", "<C-l>", "<C-\\><C-n>", opts)

keymap("n", "<leader>bd", ":bd!<CR>", opts)

keymap("t", "<C-Del>", "<C-\\><C-n>", opts)
