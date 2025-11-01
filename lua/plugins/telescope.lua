return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope", -- load only when used
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{ "<leader>ff", builtin.find_files, desc = "Find Files" },
				{ "<leader>fg", builtin.live_grep, desc = "Live Grep" },
				{ "<leader>fb", builtin.buffers, desc = "Find Buffers" },
				{ "<leader>fh", builtin.help_tags, desc = "Help Tags" },
			}
		end,
		opts = {
			defaults = {
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},
}
