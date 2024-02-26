local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
keymap("n", 'O', 'zzO', { desc = "Centered new line above" })
keymap("n", 'o', 'zzo', { desc = "Centered new line above" })

keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
