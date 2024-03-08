return {
  "rmagatti/goto-preview",
  keys = {
    {
      "gp",
      function()
        require("goto-preview").goto_preview_definition()
      end,
      mode = { "n" },
      desc = "Open preview file in reference",
    },
  },
  config = true,
}
