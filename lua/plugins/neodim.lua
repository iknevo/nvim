return {
  "zbirenbaum/neodim",
  event = "LspAttach",
  config = function()
    require("neodim").setup({
      alpha = 0.5,
      blend_color = nil,
      hide = {
        underline = false,
        virtual_text = false,
        signs = false,
      },
      regex = {
        "[uU]nused",
        "[nN]ever [rR]ead",
        "[nN]ot [rR]ead",
      },
      priority = 128,
      disable = {},
    })
  end,
}
