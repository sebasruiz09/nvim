local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

keymap("t", "<C-l>", "<C-\\><C-n>", opts)

keymap("n", "<leader>bd", ":bd!<CR>", opts)

keymap("t", "<C-Del>", "<C-\\><C-n>", opts)

keymap("n", "<leader>vn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Goes to next diagnostic error" })
keymap("n", "<leader>vp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Goes to prev diagnostic error" })
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>vca", "<md>lua vim.lsp.buf.code_action()<CR>", opts)
