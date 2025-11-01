return {
	-- NOTE: This sets the character used for indentation guides.
	-- You’ll see a faint ┊ (vertical dotted line) wherever your code indents — helps visualize nested blocks.
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "┊" },
	},
}
