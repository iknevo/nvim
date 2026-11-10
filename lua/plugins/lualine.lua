return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-mini/mini.icons",
      config = function()
        require("mini.icons").setup()
        require("mini.icons").mock_nvim_web_devicons()
      end,
    },
  },
  config = function()
    local theme = require("custom.lualine-theme").theme()

    require("lualine").setup({
      options = {
        theme = theme,
        -- theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          "branch",
          {
            "diff",
            source = function()
              local gs = vim.b.gitsigns_status_dict
              if gs then
                return { added = gs.added, modified = gs.changed, removed = gs.removed }
              end
            end,
          },
          { "diagnostics", sources = { "nvim_diagnostic" }, update_in_insert = false },
        },
        lualine_c = {
          {
            "filename",
            symbols = {
              modified = "●",
              readonly = " ",
              unnamed = "[No Name]",
            },
            path = 1,
          },
        },
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()
              return reg ~= "" and ("recording @" .. reg) or ""
            end,
            cond = function()
              return vim.fn.reg_recording() ~= ""
            end,
            color = { fg = "#91E5F6" },
          },
          {
            "filetype",
            colored = true,
            icon = { align = "left" },
          },
        },
        lualine_y = { "selectioncount" },
        lualine_z = { "searchcount" },
      },
    })

    vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
      callback = function()
        -- schedule so reg_recording() has updated by the time lualine reads it
        vim.schedule(function()
          require("lualine").refresh()
        end)
      end,
    })
  end,
}
