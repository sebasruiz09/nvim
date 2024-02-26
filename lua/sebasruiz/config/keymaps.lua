local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- telescope
keymap("n", "<C-p>", ":Telescope<CR>", opts)
keymap("n", "<C-b>", ":Telescope file_browser<CR>", opts)
keymap("n", "<C-e>", ':Telescope file_browser path=%:p:h select_buffer=true<CR>",', opts)
keymap("n", "<C-f>", ":Telescope find_files<CR>", opts)

keymap("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

keymap("n", "nv", ":Navbuddy<CR>", opts)

-- spectre
keymap("n", "<leader>l", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})

keymap("n", "<leader>e", ":Oil<CR>", {
  desc = "Oil explorer",
})

-- trouble
keymap("n", "<leader>t", ":Trouble<CR>", opts)
keymap("n", "<leader>tt", ":TroubleClose<CR>", opts)

keymap("v", "<leader>lw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})

keymap("n", "<leader>ll", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

--resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- tabby
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gt", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tg", ":tabp<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

keymap("n", "<leader>rr", "<Plug>RestNvim", opts)

-- term exit
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n>", { noremap = true })

--buffers navigation
keymap("n", "<leader>bd", ":bd!<CR>", opts)

keymap("t", "<C-Del>", "<C-\\><C-n>", opts)
