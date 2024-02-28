local M = {
	'williamboman/mason-lspconfig.nvim',

	depedencies = {
		{ 'williamboman/mason.nvim', config = true },
		{ 'j-hui/fidget.nvim', opts = {} },
	},
}

M.servers = {
	'lua_ls',
	'rust_analyzer',
	'gopls',
}

function M.config()
	require('mason').setup()

	require('mason-lspconfig').setup {
	  ensure_installed = M.servers,
	}
end

return M
