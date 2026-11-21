return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  opts = {
    ring = {
      history = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
    },
    highlight = {
      timer = 200,
    },
  },
  keys = {
    {
      "<leader>sy",
      function()
        Snacks.picker.yanky()
      end,
      desc = "Yank history",
    },
  },
}
