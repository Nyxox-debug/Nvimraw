return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	config = function()
		local incline = require("incline")

		incline.setup({
			highlight = {
				groups = {
					-- Active window label
					InclineNormal = {
						guibg = "#b505a6", -- magenta
						guifg = "#000000", -- bright blue
					},
					-- Inactive window label
					InclineNormalNC = {
						guibg = "#0a021a", -- darker magenta for contrast
						guifg = "#341475", -- softer blue
					},
				},
			},
			window = {
				margin = { vertical = 1, horizontal = 1 },
				padding = 1,
				placement = {
					horizontal = "right",
					vertical = "top",
				},
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = filename .. " ●"
				end
				return filename
			end,
		})
	end,
}
