return {
  "simrat39/rust-tools.nvim",
  lazy = true,
  config = function()
    local rt = require("sebasruiz.plugins.lsp.rust-tools")
    rt.setup({
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set("n", "<C-d>", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
    })
  end,
}
