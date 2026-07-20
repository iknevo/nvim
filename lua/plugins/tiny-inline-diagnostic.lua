return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      -- "modern", "classic", "minimal", "powerline",
      -- "ghost", "simple", "nonerdfont", "amongus"
      preset = "classic",
      options = {
        use_icons_from_diagnostic = true,
        show_diags_only_under_cursor = true,

        multilines = {
          enabled = true,
          always_show = false,
        },

        show_source = {
          enabled = false,
        },

        break_line = {
          enabled = false,
        },

        overflow = {
          mode = "wrap",
        },
      },
    })
    vim.diagnostic.config({ virtual_text = false })
    local function clear_tiny_inline_backgrounds()
      local groups = vim.fn.getcompletion("TinyInlineDiagnostic", "highlight")
      for _, group in ipairs(groups) do
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
          name = group,
          link = false,
        })
        if ok and hl then
          hl.bg = nil
          hl.ctermbg = nil

          pcall(vim.api.nvim_set_hl, 0, group, hl)
        end
      end
    end
    vim.schedule(clear_tiny_inline_backgrounds)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.schedule(clear_tiny_inline_backgrounds)
      end,
    })
  end,
}
