return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    {
      "<leader>cj",
      "<cmd>TSJToggle<cr>",
      desc = "Toggle Treesj",
    },
  },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      notify = false,
    })
  end,
}
