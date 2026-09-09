return {
  { "nvim-mini/mini.pairs", event = "VeryLazy", opts = {} },
  {
    "nvim-mini/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",

        line_left = "",
        line_right = "",
        line_down = "",
        line_up = "",
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
      },
    },
  },
  { "nvim-mini/mini.ai", version = "*", opts = {} },
  {
    "nvim-mini/mini.icons",
    version = "*",
    opts = {
      file = {
        [".prettierrc"] = { glyph = "", hl = "MiniIconsOrange" },
        ["favicon.ico"] = { glyph = "", hl = "MiniIconsOrange" },
        ["components.json"] = { glyph = "󰋘", hl = "MiniIconsCyan" },
        [".env"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.example"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.local"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.production"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.staging"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.test"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
      },
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
    end,
  },
  {
    "nvim-mini/mini.indentscope",
    version = "*",
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 200,
        },
        -- symbol = "│",
      })
    end,
  },
}
