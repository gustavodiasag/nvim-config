local M = {
	'hrsh7th/nvim-cmp',

	dependencies = {
		-- Completes words for the current buffer.
		'hrsh7th/cmp-buffer',
		-- Completes files.
		'hrsh7th/cmp-path',
		-- Functionalities like autoimport, snippet expansion, etc.
		'hrsh7th/cmp-nvim-lsp',

		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets',
	},
}

M.config = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	require('luasnip.loaders.from_vscode').lazy_load()
	luasnip.config.setup({})

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = {
			completeopt = 'menu,menuone,noinsert',
		},
		mapping = cmp.mapping.preset.insert({
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete({}),
			['<CR>'] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		}),
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'path' },
			{ name = 'buffer', keyword_length = 5 },
		},
	})
end

return M
