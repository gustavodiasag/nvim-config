-- Base mappings and settings
require 'user.launch'
require 'user.options'
require 'user.keymaps'

spec 'user.whichkey'
spec 'user.telescope'
spec 'user.colorscheme'

-- LSṔ-related plugins
spec 'user.lsp.mason'
spec 'user.lsp.mason-lspconfig'
spec 'user.lsp.lspconfig'

-- Git-related plugins
spec 'user.git.fugitive'
spec 'user.git.rhubarb'

require 'user.lazy'
