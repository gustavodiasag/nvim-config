local opt = vim.o

opt.hlsearch = false

vim.wo.number = true
vim.wo.relativenumber = true

opt.mouse = 'a'

opt.clipboard = 'unnamedplus'

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

vim.wo.signcolumn = 'yes'

opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = 'menuone,noselect'

opt.termguicolors = true

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
