return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      lsp_doc_border = true,
    },

    notify = {
      enabled = true,
      view = "notify",
    },

    cmdline = {
      view = "cmdline",
      format = {
        search_down = { view = "cmdline" },
        search_up = { view = "cmdline" },
      },
    },

    views = {
      notify = {
        position = { row = 2, col = "100%" },
        size = { width = 50 },
        border = { style = "rounded" },
      },
    },

    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "written" },
            { find = "yanked" },
            { find = "change" },
          },
        },
        opts = { skip = true },
      },
    },
  },

  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
-- return {
-- 	"folke/noice.nvim",
-- 	event = "VeryLazy",
-- 	opts = {
-- 		presets = {
-- 			lsp_doc_border = true,
-- 		},
-- 		notify = {
-- 			enabled = true,
-- 			view = "notify",
-- 		},
-- 		cmdline = {
-- 			view = "cmdline",
-- 			format = {
-- 				search_down = {
-- 					view = "cmdline",
-- 				},
-- 				search_up = {
-- 					view = "cmdline",
-- 				},
-- 			},
-- 		},
-- 		views = {
-- 			notify = {
-- 				position = { row = 2, col = "100%" },
-- 				size = { width = 50 },
-- 				border = { style = "rounded" },
-- 			},
-- 		},
-- 		routes = {
-- 			{
-- 				filter = {
-- 					event = "msg_show",
-- 					any = {
-- 						{ find = "written" },
-- 						{ find = "yanked" },
-- 						{ find = "change" },
-- 					},
-- 				},
-- 				opts = { skip = true },
-- 			},
-- 		},
-- 	},
-- 	dependencies = {
-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
-- 		"MunifTanjim/nui.nvim",
-- 		-- OPTIONAL:
-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
-- 		--   If not available, we use `mini` as the fallback
-- 		"rcarriga/nvim-notify",
-- 	},
-- }
