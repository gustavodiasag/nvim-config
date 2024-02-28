local M = {
	'neovim/nvim-lspconfig',

	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'folke/neodev.nvim',
	},
}

local on_attach = function(_, bufnr)
	-- Helper function to easily define mapppings specific for
	-- LSP-related items.
	local nmap = function(key, fn, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', key, fn, { buffer = bufnr, desc = desc })
	end

	local builtin = require('telescope.builtin')

	nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
	nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
	nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
	nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
	nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
	nmap('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
	nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
	nmap('<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, '[W]orkspace [L]ist Folders')

	-- Formatting
	vim.keymap.set('n', '<leader>f', function()
		vim.lsp.buf.format { async = true }
	end, {})
end

function M.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

	return capabilities
end

function M.config()
	local servers = {
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	}

	require('neodev').setup()

	local mason_lspconfig = require 'mason-lspconfig'

	mason_lspconfig.setup_handlers {
		function(server_name)
			require('lspconfig')[server_name].setup {
				capabilities = M.capabilities(),
				on_attach = on_attach,
				settings = servers[server_name],
				filetypes = (servers[server_name] or {}).filetypes,
			}
		end,
	}
end

return M
