return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Pure monochrome palette
		local colors = {
			black = "#000000",
			dark_gray = "#1c1c1c",
			gray = "#3a3a3a",
			light_gray = "#bcbcbc",
			white = "#ffffff",
		}

		-- All modes are grayscale only (contrast-based)
		local my_lualine_theme = {
			normal = {
				a = { bg = colors.light_gray, fg = colors.black, gui = "bold" },
				b = { bg = colors.gray, fg = colors.white },
				c = { bg = colors.dark_gray, fg = colors.white },
			},
			insert = {
				a = { bg = colors.white, fg = colors.black, gui = "bold" },
				b = { bg = colors.gray, fg = colors.white },
				c = { bg = colors.dark_gray, fg = colors.white },
			},
			visual = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.gray, fg = colors.white },
				c = { bg = colors.dark_gray, fg = colors.white },
			},
			command = {
				a = { bg = colors.dark_gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.gray, fg = colors.white },
				c = { bg = colors.dark_gray, fg = colors.white },
			},
			replace = {
				a = { bg = colors.black, fg = colors.white, gui = "bold" },
				b = { bg = colors.gray, fg = colors.white },
				c = { bg = colors.dark_gray, fg = colors.white },
			},
			inactive = {
				a = { bg = colors.black, fg = colors.gray, gui = "bold" },
				b = { bg = colors.black, fg = colors.gray },
				c = { bg = colors.black, fg = colors.gray },
			},
		}

		lualine.setup({
			options = {
				theme = my_lualine_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.white },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}

-- return {
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		config = function()
-- 			require("lualine").setup({
-- 				options = { theme = "auto", section_separators = "", component_separators = "" },
-- 			})
-- 		end,
-- 	},
-- }
