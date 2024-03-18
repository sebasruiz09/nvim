return {
  "dmmulroy/ts-error-translator.nvim",
  event = "BufEnter *.ts",
  config = function()
    require("ts-error-translator").setup({
      auto_override_publish_diagnostics = true,
    })
  end,
}
