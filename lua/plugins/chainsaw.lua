return {
  "chrisgrieser/nvim-chainsaw",
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
