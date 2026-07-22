return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",

  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    "xzbdmw/colorful-menu.nvim",
  },

  opts = {
    snippets = {
      preset = "luasnip",
    },

    appearance = {
      use_nvim_cmp_as_default = true,
    },

    keymap = {
      preset = "none",

      ["<C-j>"] = { "select_next", "fallback_to_mappings" },
      ["<C-k>"] = { "select_prev", "fallback_to_mappings" },

      ["<CR>"] = { "accept", "fallback" },

      ["<C-Space>"] = {
        "show",
      },

      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-i>"] = {
        function(cmp)
          if cmp.is_signature_visible() then
            cmp.hide_signature()
          else
            cmp.show_signature()
          end
        end,
      },
    },

    completion = {
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },

      accept = {
        auto_brackets = {
          enabled = false,
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },

      menu = {
        auto_show = true,
        border = "rounded",
        scrollbar = false,
        max_height = 12,

        draw = {
          columns = {
            { "kind_icon" },
            { "label", gap = 1 },
            { "kind" },
          },
        },
      },
    },

    signature = {
      enabled = true,
      trigger = {
        show_on_trigger_character = false,
        show_on_insert = false,
        show_on_accept = false,
        show_on_insert_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
        show_on_keyword = false,
        blocked_trigger_characters = { "(", ")", "," },
      },
      window = {
        border = "rounded",
      },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
        "lazydev",
      },

      providers = {
        lsp = {
          opts = {
            tailwind_color_icon = "󰝤",
          },
        },

        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },

  config = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load()

    local colorful_menu = require("colorful-menu")

    opts.completion.menu.draw.components = {
      kind_icon = {
        text = function(ctx)
          return ctx.kind_icon .. ctx.icon_gap
        end,
      },

      label = {
        text = function(ctx)
          return colorful_menu.blink_components_text(ctx)
        end,

        highlight = function(ctx)
          return colorful_menu.blink_components_highlight(ctx)
        end,
      },
    }

    require("blink.cmp").setup(opts)

    -- vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { bg = "NONE" })
    --
    -- vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", {
    --   link = "PmenuSel",
    -- })
    --
    -- vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", {
    --   link = "Comment",
    -- })

    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#6e6a86", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "NONE", fg = "#6e6a86" })
    vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#6e6a86", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#6e6a86", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#242424" })
    vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = "#cecacd" })
    vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = "#6e6a86" })
  end,
}
