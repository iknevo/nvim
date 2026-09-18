return {
  "saghen/blink.indent",
  opts = {
    mappings = {
      border = "both",
      goto_top = "gt",
      goto_bottom = "gb",
    },
    static = {
      enabled = false,
    },
    scope = {
      enabled = true, -- highlight highest level of indentation on the current line
      indent_at_cursor = false, -- clamp to indent level of cursor
      char = "╎",
      priority = 1000,
      -- optionally add: 'BlinkIndentRed', 'BlinkIndentCyan', 'BlinkIndentYellow', 'BlinkIndentGreen'
      -- highlights = { "BlinkIndentOrange", "BlinkIndentViolet", "BlinkIndentBlue" },
      highlights = { "BlinkIndentScope" },
      underline = {
        enabled = false,
      },
    },
  },
}
