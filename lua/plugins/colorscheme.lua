return {
	{
		"sainnhe/gruvbox-material",
		-- Loads before all the other plugins.
		priority = 1000,
		-- Configuration for vim plugins typically should be set in an `init` function.
		init = function()
			vim.g.gruvbox_material_background = "hard"
		end,
		-- Load the colorscheme.
		config = function()
			vim.cmd([[colorscheme gruvbox-material]])
		end,
	},
}
