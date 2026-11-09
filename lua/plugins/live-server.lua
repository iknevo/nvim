return {
  {
    "barrett-ruth/live-server.nvim",
    ft = { "html" },
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },

    init = function()
      vim.g.live_server = {
        port = 5500,
        browser = "default",
        quiet = false,
      }
    end,

    keys = {
      {
        "<leader>cl",
        "<cmd>LiveServerToggle<CR>",
        desc = "Live Server Toggle",
      },
    },
  },
}
