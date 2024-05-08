local opt = vim.o

-- Completion
opt.completeopt = "menuone,noselect"

-- Editor
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.signcolumn = "yes"
opt.undofile = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- System
opt.updatetime = 250
opt.timeoutlen = 300
opt.mouse = "a"
opt.termguicolors = true

-- Visual highlighting for the 'yank' command
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

opt.termguicolors = true
