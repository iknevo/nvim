local M = {}

M.theme = function()
  local colors = {
    gray = "#a5b5b5",
    darkgray = "#16161d",

    normal = "#91E5F6",
    insert = "#98bb6c",
    visual = "#ffa066",
    replace = "#e46876",
    command = "#e6c384",
    terminal = "#7fb4ca",
  }

  local function mode(bg)
    return {
      a = { fg = colors.darkgray, bg = bg, gui = "bold" },
      b = { fg = colors.gray, bg = "NONE" },
      c = { fg = colors.gray, bg = "NONE" },
    }
  end

  return {
    normal = mode(colors.normal),
    insert = mode(colors.insert),
    visual = mode(colors.visual),
    replace = mode(colors.replace),
    command = mode(colors.command),
    terminal = mode(colors.terminal),

    inactive = {
      a = { fg = colors.gray, bg = "NONE", gui = "bold" },
      b = { fg = colors.gray, bg = "NONE" },
      c = { fg = colors.gray, bg = "NONE" },
    },
  }
end

return M
