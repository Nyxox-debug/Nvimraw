return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		-- Define custom highlight colors
		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })

		-- Store the default config
		local default_config = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
			},
			query = {
				[""] = "rainbow-delimiters",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}

		-- Default setup
		vim.g.rainbow_delimiters = default_config

		-- ✅ Add toggle function
		local rainbow_enabled = true
		local function toggle_rainbow_delimiters()
			rainbow_enabled = not rainbow_enabled

			if rainbow_enabled then
				vim.g.rainbow_delimiters = default_config
				vim.cmd("doautocmd User RainbowDelimitersEnable")
				print("🌈 Rainbow Delimiters: ON")
			else
				vim.g.rainbow_delimiters = nil
				vim.cmd("doautocmd User RainbowDelimitersDisable")
				print("🌈 Rainbow Delimiters: OFF")
			end

			-- Refresh the buffer
			vim.cmd("edit!")
		end

		-- 🗝️ Add keymap
		vim.keymap.set("n", "<leader>tr", toggle_rainbow_delimiters, { desc = "Toggle rainbow delimiters" })
	end,
}
