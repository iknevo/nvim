return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local theme = require("custom.lualine-theme").theme()

    local function setup()
      require("lualine").setup({
        options = {
          theme = theme,
          globalstatus = true,
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
          vim.schedule(function()
            require("lualine").refresh()
          end)
        end,
      })
    end

    local dashboard_open = vim.iter(vim.api.nvim_list_wins()):any(function(win)
      return vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "snacks_dashboard"
    end)

    if dashboard_open then
      vim.api.nvim_create_autocmd("User", {
        pattern = "SnacksDashboardClosed",
        once = true,
        callback = function()
          vim.schedule(setup)
        end,
      })
    else
      setup()
    end
  end,
}
