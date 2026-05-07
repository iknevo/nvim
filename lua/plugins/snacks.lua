return {
  "folke/snacks.nvim",
  keys = {
    -- { "<leader>fF", false },
    -- { "<leader>sC", false },
    -- { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    -- { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
    -- { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    -- {
    --   "<leader>sc",
    --   function()
    --     Snacks.picker.commands()
    --   end,
    --   desc = "Search Commands",
    -- },
    {
      "<leader>ft",
      function()
        Snacks.terminal()
      end,
      desc = "Terminal (cwd)",
    },

    {
      "<leader>fT",
      function()
        Snacks.terminal(nil, { cwd = LazyVim.root() })
      end,
      desc = "Terminal (Root Dir)",
    },
  },
  opts = {
    image = {},
    input = {},
    statuscolumn = {},
    picker = {
      sources = {
        files = {
          hidden = false,
          ignored = false,
          exclude = { "node_modules", "dist", "build", ".next" },
        },
        grep = {
          hidden = false,
          ignored = true,
          exclude = { "node_modules", ".git", "dist", "build", ".next" },
        },
        explorer = {
          show__modified = true,
          replace_netrw = true,
          trash = true,
          -- auto_close = true,
          hidden = false,
          ignored = false,
          exclude = { "node_modules" },
          layout = { layout = { position = "left", width = 35 } },
          -- exclude = { "node_modules", ".git", "dist", "build", ".next" },
        },
      },
      icons = {
        modified = "●",
        readonly = "",
        git = {
          -- staged = "●",
          -- added = "A",
          -- deleted = "D",
          -- ignored = "",
          -- modified = "M",
          -- renamed = "R",
          -- untracked = "U",
          added = "",
          modified = "",
          -- modified = "",
          deleted = "",
          renamed = "󰁕",
          untracked = "",
          -- unstaged = "",
          unstaged = "",
          staged = "",
          conflict = "",
          ignored = "",
        },
      },
    },
    dashboard = {
      preset = {
        header = [[
          ███╗   ██╗███████╗██╗   ██╗ ██████╗ 
          ████╗  ██║██╔════╝██║   ██║██╔═══██╗
          ██╔██╗ ██║█████╗  ██║   ██║██║   ██║
          ██║╚██╗██║██╔══╝  ╚██╗ ██╔╝██║   ██║
          ██║ ╚████║███████╗ ╚████╔╝ ╚██████╔╝
          ╚═╝  ╚═══╝╚══════╝  ╚═══╝   ╚═════╝ 
      ]],
      },
    },
  },
}
