return {
  "code-biscuits/nvim-biscuits",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    cursor_line_only = true,
  },
}
