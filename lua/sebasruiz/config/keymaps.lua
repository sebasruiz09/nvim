local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("t", "<C-l>", "<C-\\><C-n>", opts)

keymap("n", "<leader>bd", ":bd!<CR>", opts)
keymap("n", "<leader>bb", ":Buffers<CR>", opts)

keymap("t", "<C-Del>", "<C-\\><C-n>", opts)

vim.keymap.set("n", "<leader>zn", function()
  require("telescope").extensions.notify.notify()
end, { desc = "Telescope notification history" })
