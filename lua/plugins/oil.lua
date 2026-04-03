return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.api.nvim_set_hl(0, "NormalFloat", {
			bg = "#000000",
			fg = "#ffffff",
		})

		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = "#ffffff",
			bg = "#000000",
		})

		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
			},
			-- float = {
			-- 	padding = 2,
			-- 	max_width = 0.5,
			-- 	max_height = 0.5,
			-- 	border = "single",
			-- 	win_options = {
			-- 		winblend = 0,
			-- 	},
			-- },
		})
	end,
}
