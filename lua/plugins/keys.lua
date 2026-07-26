-- return {
--   "NStefan002/screenkey.nvim",
--   lazy = false,
--   version = "*",
--   opts = {
--     win_opts = {
--       title = "",
--     },
--   },
--   keys = {
--     {
--       "<leader>uk",
--       function()
--         require("screenkey").toggle()
--       end,
--       desc = "Toggle Screenkey",
--     },
--   },
-- }
return {
  "nvchad/showkeys",
  cmd = "ShowkeysToggle",
  keys = {
    { "<leader>uk", "<cmd>ShowkeysToggle<cr>", desc = "Show keys" },
  },
  opts = {
    timeout = 2,
    maxkeys = 5,
    position = "bottom-right",
    show_count = true,
    winopts = {
      border = "rounded",
    },
  },
}
