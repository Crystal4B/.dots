return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load first
	config = function()
		local everforest = require("everforest")
		everforest.setup({
			background = "hard",
			transparent_background_level = 2,
			italics = true,
		})
		everforest.load()
	end,
}
