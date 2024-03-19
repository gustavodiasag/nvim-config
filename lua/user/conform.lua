local M = {
  'stevearc/conform.nvim',
  opts = {},
}

M.config = function()
	require('conform').setup {
		formatters_by_ft = {
			lua = { 'stylua' },
			go = { 'gopls' },
			rust = { 'rustfmt' },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	}
end

return M
