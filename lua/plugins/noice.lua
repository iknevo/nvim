return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        cmdline = { icon = ":" },
        search_down = { icon = "/", kind = "search" },
        search_up = { icon = "/", kind = "search" },
      },
    },

    messages = {
      enabled = true,
      view = "mini",
    },

    popupmenu = {
      enabled = true,
      backend = "nui",
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
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },

    lsp = {
      progress = {
        enabled = true,
        view = "mini",
      },

      hover = {
        enabled = false,
      },

      signature = {
        enabled = false,
      },

      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = false,
      },
    },

    routes = {
      {
        view = "mini",
        filter = {
          event = "msg_showmode",
          find = "recording",
        },
      },

      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "msg_show",
          find = "lines",
        },
        opts = { skip = true },
      },

      {
        filter = {
          event = "notify",
          find = "No information available",
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
