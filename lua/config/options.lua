-- Auto formatting.
vim.g.autoformat = true
-- Supress deprecation warnings.
vim.g.deprecation_warnings = false
-- Whether a Nerd Font is installed and selected in the terminal.
vim.g.have_nerd_font = true
-- Fix markdown indentation settings.
vim.g.markdown_recommended_style = 0
-- Disable netwr.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.autowrite = true
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true -- Enable highlighting of the current line.
opt.expandtab = true -- Use spaces instead of tabs.
opt.linebreak = true -- Wrap lines at convenient points.
opt.mouse = "a" -- Enable mouse mode.
opt.number = true -- Print line number.
opt.relativenumber = true -- Relatieve line numbers.
opt.shiftround = true -- Round indent.
opt.shiftwidth = 2 -- Size of an indent.
opt.signcolumn = "yes" -- Always sho the signcolumn, otherwise it would shift the text each time.
opt.smartindent = true -- Insert indents automatically.
opt.spelllang = { "en" }
opt.tabstop = 2 -- Number of spaces tabs count for.
opt.termguicolors = true -- True color support.
opt.undofile = true
opt.wrap = false -- Disable line wrap.

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
