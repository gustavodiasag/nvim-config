local colorscheme = vim.cmd.colorscheme

local M = {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
}

M.config = function()
	vim.g.gruvbox_material_foreground = "material"
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_ui_contrast = "low"

	colorscheme("gruvbox-material")
end

return M
