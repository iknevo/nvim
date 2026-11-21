return {
  "mawkler/modicator.nvim",
  dependencies = "ribru17/bamboo.nvim", -- Add your colorscheme plugin here
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    show_warnings = false,
  },
}
