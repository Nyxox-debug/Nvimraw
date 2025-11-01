return {
	--NOTE: That small snippet installs and configures a plugin called stevearc/dressing.nvim
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			border = "rounded",
			win_options = { winblend = 10 }, -- transparency
		},
		select = {
			backend = { "telescope", "builtin" }, -- use telescope first if available
		},
	},
}
