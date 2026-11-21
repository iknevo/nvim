return {
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      char = { "┆" },
      virtcolumn = "100",
      highlight = { "NonText" },
    },
  },
}
