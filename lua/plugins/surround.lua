return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- stable version
	config = function()
		local surround = require("nvim-surround")

		surround.setup({
			keymaps = {
				insert = "<C-g>s", -- Add surrounding in insert mode
				insert_line = "<C-g>S", -- Add surrounding to new lines
				normal = "ys", -- Add surround
				normal_cur = "yss", -- Surround current line
				normal_line = "yS", -- Surround entire line
				normal_cur_line = "ySS", -- Surround current line (including indent)
				visual = "S", -- Surround visual selection
				delete = "ds", -- Delete surround
				change = "cs", -- Change surround
			},

			-- Optional custom surrounds
			surrounds = {
				-- Wrap with a function call, e.g., "yswf" → wrap word in function()
				["f"] = {
					add = function()
						local function_name = vim.fn.input("Function name: ")
						return { { function_name .. "(" }, { ")" } }
					end,
				},
				-- Markdown bold: **text**
				["b"] = {
					add = { { "**" }, { "**" } },
				},
				-- Markdown italics: *text*
				["i"] = {
					add = { { "*" }, { "*" } },
				},
				-- Angle brackets: <text>
				["<"] = {
					add = { { "<" }, { ">" } },
				},
			},
		})
	end,
}
