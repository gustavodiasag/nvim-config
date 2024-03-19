local colorscheme = vim.cmd.colorscheme

local M = {
	'folke/tokyonight.nvim',
	lazy = false,
	priority = 1000,
}

M.config = function()
	colorscheme('tokyonight-night')
end

return M
