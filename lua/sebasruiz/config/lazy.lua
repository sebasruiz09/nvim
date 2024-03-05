local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "sebasruiz.plugins" },
    { import = "sebasruiz.plugins.start" },
    { import = "sebasruiz.plugins.ui" },
    { import = "sebasruiz.plugins.lsp" },
    { import = "sebasruiz.plugins.snippets" },
    { import = "sebasruiz.plugins.format" },
  },
  checker = { enable = true, notify = false },
  dev = {
    paths = {
      "~/sebasruiz/plugins",
    },
    fallback = true,
    patterns = { "sebasruiz" },
  },
})
