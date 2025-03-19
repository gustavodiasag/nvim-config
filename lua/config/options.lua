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

local o = vim.opt

o.completeopt = "menu,menuone,noselect"
-- Enable highlighting of the current line.
o.cursorline = true
-- Use spaces instead of tabs.
o.expandtab = true
-- Insert indents automatically.
o.smartindent = true
-- Number of spaces tabs count for.
o.tabstop = 2
-- Size of an indent.
o.shiftwidth = 2
-- Wrap lines at convenient points.
o.linebreak = true
-- Enable mouse mode.
o.mouse = "a"
-- Print line number.
o.number = true
-- Relatieve line numbers.
o.relativenumber = true
-- Round indent.
o.shiftround = true
-- Always sho the signcolumn, otherwise it would shift the text each time.
o.signcolumn = "yes"
-- Enable spell checking.
o.spell = false
-- Spell checking will be done for the below languages.
o.spelllang = { "en_us" }
-- Set light theme
o.background = "light"
-- True color support.
o.termguicolors = true
-- Save undo history to an undo file.
o.undofile = true
-- Disable line wrap.
o.wrap = false

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
