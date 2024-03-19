-- Base mappings and settings
require('user.launch')
require('user.options')
require('user.keymaps')

-- General purpose plugins
spec('user.whichkey')
spec('user.telescope')
spec('user.treesitter')
spec('user.colorscheme')
spec('user.cmp')
spec('user.comment')

-- LSṔ-related plugins
spec('user.lsp.mason')
spec('user.lsp.mason-lspconfig')
spec('user.lsp.lspconfig')

-- Git-related plugins
spec('user.git.fugitive')
spec('user.git.rhubarb')
spec('user.git.gitsigns')

require('user.lazy')
