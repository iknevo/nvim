return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    display = {
      theme = "atom",
      flavor = "dark",
      view = "full"
    },
    idle = {
      enabled = false,
    },
    text = {
      workspace = '',
    },
    hooks = {
      post_activity = function(_, activity)
        activity.type = 'listening' -- 'playing' | 'listening' | 'watching' | 'competing'
        activity.status_display_type = 'name' -- 'name' | 'details' | 'state'
      end,
    },
    advanced = {
      discord = {
        reconnect = {
          enabled = true,
        },
      },
    },
  },
}
