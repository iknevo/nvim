return {
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function(_, opts)
      local pairs = require("mini.pairs")
      pairs.setup(opts)
      local open = pairs.open
      pairs.open = function(pair, neigh_pattern)
        if vim.fn.getcmdline() ~= "" then
          return open(pair, neigh_pattern)
        end
        local o, c = pair:sub(1, 1), pair:sub(2, 2)
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local next = line:sub(cursor[2] + 1, cursor[2] + 1)
        local before = line:sub(1, cursor[2])
        if
          opts.markdown
          and o == "`"
          and vim.bo.filetype == "markdown"
          and before:match("^%s*``")
        then
          return "`\n```" .. vim.api.nvim_replace_termcodes(" ", true, true, true)
        end
        if opts.skip_next and next ~= "" and next:match(opts.skip_next) then
          return o
        end
        if opts.skip_ts and #opts.skip_ts > 0 then
          local ok, captures =
            pcall(vim.treesitter.get_captures_at_pos, 0, cursor[1] - 1, math.max(cursor[2] - 1, 0))
          for _, capture in ipairs(ok and captures or {}) do
            if vim.tbl_contains(opts.skip_ts, capture.capture) then
              return o
            end
          end
        end
        if opts.skip_unbalanced and next == c and c ~= o then
          local _, count_open = line:gsub(vim.pesc(pair:sub(1, 1)), "")
          local _, count_close = line:gsub(vim.pesc(pair:sub(2, 2)), "")
          if count_close > count_open then
            return o
          end
        end
        return open(pair, neigh_pattern)
      end
    end,
  },
  {
    "nvim-mini/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",

        line_left = "",
        line_right = "",
        line_down = "",
        line_up = "",
      },
    },
  },
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
      },
    },
  },
  { "nvim-mini/mini.ai", version = "*", opts = {} },
  {
    "nvim-mini/mini.icons",
    version = "*",
    opts = {
      file = {
        [".prettierrc"] = { glyph = "", hl = "MiniIconsOrange" },
        ["favicon.ico"] = { glyph = "", hl = "MiniIconsOrange" },
        ["components.json"] = { glyph = "󰋘", hl = "MiniIconsCyan" },
        [".env"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.example"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.local"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.production"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.staging"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
        [".env.test"] = { glyph = "󰘮", hl = "MiniIconsYellow" },
      },
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
    end,
  },
  {
    "nvim-mini/mini.indentscope",
    version = "*",
    enabled = false,
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 200,
        },
        -- symbol = "│",
        options = { try_as_border = true },
      })
    end,
  },
  {
    "nvim-mini/mini.hipatterns",
    event = "VeryLazy",
    config = function()
      require("mini.hipatterns").setup({
        highlighters = {
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
