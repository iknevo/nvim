return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-z>",
        accept_word = "<C-]>",
      },
      -- color = {
      --   suggestion_color = "#ffffff",
      --   cterm = 244,
      -- },
      log_level = "off",
      disable_inline_completion = false,
      disable_keymaps = false,
    })
  end,
}
