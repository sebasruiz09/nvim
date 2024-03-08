vim.diagnostic.config({
  virtual_text = {
    prefix = "󰄛 ",
  },
})

local signs = { Warn = " ", Error = " ", Hint = " ", info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
