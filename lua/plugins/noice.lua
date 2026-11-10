return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = ":" },
        lua = false,
        help = false,
        filter = false,
      },
    },

    messages = {
      view = "mini",
      view_search = false,
    },

    notify = {
      enabled = false,
    },

    commands = {
      history = {
        view = "split",
        opts = {
          enter = true,
          format = "details",
          size = "50%",
        },
      },
    },

    presets = {
      long_message_to_split = true,
    },

    lsp = {
      progress = {
        enabled = true,
        view = "mini",
      },
      hover = { enabled = false },
      signature = { enabled = false },
    },

    views = {
      mini = {
        win_options = { winblend = 0 },
      },
    },

    routes = {
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        opts = { skip = true },
      },
      {
        filter = { event = "msg_show", find = "%d+L, %d+B" },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          any = {
            { find = "%d+ more lines" },
            { find = "%d+ fewer lines" },
            { find = "%d+ lines yanked" },
            { find = "%d+ lines [<>]ed" },
            { find = "%d+ lines moved" },
          },
        },
        opts = { skip = true },
      },
    },
  },

  keys = {
    {
      "<leader>nh",
      function()
        require("noice").cmd("history")
      end,
      desc = "Noice History",
    },
    {
      "<leader>nl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Noice Last Message",
    },
    {
      "<leader>ne",
      function()
        require("noice").cmd("errors")
      end,
      desc = "Noice Errors",
    },
    {
      "<leader>nd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss Notifications",
    },
  },
}
