local notify = require("notify")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local filename = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":t")
    local filesize = vim.fn.getfsize(vim.fn.expand("%"))
    notify(filename .. " (" .. filesize .. " bytes)", "info", { title = "Written" })
  end,
})
