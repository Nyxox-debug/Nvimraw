return {
	"echasnovski/mini.pairs",
	version = false, -- use latest
	event = "VeryLazy",
	config = function()
		require("mini.pairs").setup()
	end,
}
