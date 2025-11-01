return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- for lazy updates count

		-- Default Neovim-like colors (neutral gray with blue highlight)
		local colors = {
			red = "#ff5f5f",
			dark_red = "#af0000",
			black = "#202020",
			gray = "#808080",
			light_gray = "#c0c0c0",
			accent_gray = "#303030",
			blue = "#5f87ff",
			green = "#5faf5f",
			yellow = "#ffd75f",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
				b = { bg = colors.accent_gray, fg = colors.light_gray },
				c = { bg = colors.black, fg = colors.light_gray },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.accent_gray, fg = colors.light_gray },
				c = { bg = colors.black, fg = colors.light_gray },
			},
			visual = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
				b = { bg = colors.accent_gray, fg = colors.light_gray },
				c = { bg = colors.black, fg = colors.light_gray },
			},
			command = {
				a = { bg = colors.gray, fg = colors.black, gui = "bold" },
				b = { bg = colors.accent_gray, fg = colors.light_gray },
				c = { bg = colors.black, fg = colors.light_gray },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.accent_gray, fg = colors.light_gray },
				c = { bg = colors.black, fg = colors.light_gray },
			},
			inactive = {
				a = { bg = colors.black, fg = colors.gray, gui = "bold" },
				b = { bg = colors.black, fg = colors.gray },
				c = { bg = colors.black, fg = colors.gray },
			},
		}

		-- configure lualine with modified theme
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
						color = { fg = colors.blue },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
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
