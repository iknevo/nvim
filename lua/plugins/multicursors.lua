return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/hydra.nvim",
  },
  opts = {
    hint_config = false,
  },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  keys = {
    {
      mode = { "v", "n" },
      "<leader>m",
      function()
        require("which-key").show({ keys = "<leader>m" })
        vim.cmd("MCstart")
      end,
      desc = "Multi-cursor",
    },
  },
}
