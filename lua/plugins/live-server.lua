return {
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
    keys = {
      { "<leader>r", "<cmd>LiveServerToggle<CR>", desc = "Live Server Toggle" },
    },
  },
}
