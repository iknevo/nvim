return {
  "chrisgrieser/nvim-chainsaw",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>lg",
      function()
        require("chainsaw").variableLog()
      end,
      mode = { "n" },
      desc = "Log Variable",
    },
  },
}
