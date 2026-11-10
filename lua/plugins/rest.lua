return {
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },

    init = function()
      vim.g.rest_nvim = {
        response = {
          hooks = {
            format = true,
          },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "json",
        callback = function(ev)
          vim.bo[ev.buf].formatexpr = ""
          vim.bo[ev.buf].formatprg = "jq"
        end,
      })
    end,

    config = function()
      vim.keymap.set("n", "<leader>rn", "<cmd>Rest run<cr>", {
        buffer = true,
        desc = "Run HTTP request",
      })
    end,
  },
}
