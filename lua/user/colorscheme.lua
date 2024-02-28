local colorscheme = vim.cmd.colorscheme

local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  colorscheme 'tokyonight-night'
end

return M
