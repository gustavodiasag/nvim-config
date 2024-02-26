local M = {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',

    {
    	'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			lazy = true,
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
    },
  },
}

function M.config()
	local builtin = require('telescope.builtin')
	local keymap = vim.keymap.set
	
	keymap('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
	keymap('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
	keymap('n', '<leader>/', function()
		builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = '[/] Fuzzily search in current buffer' })
	
	keymap('n', '<leader>s/', function()
		builtin.live_grep {
			grep_open_files = true
		}
	end, { desc = '[S]earch [/] in Open Files' })

	keymap('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	keymap('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
	keymap('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	keymap('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	keymap('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	keymap('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	keymap('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
	keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	keymap('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

	-- Function to find the git root directory based on the current buffer's path
	local function find_git_root()
	  local current_file = vim.api.nvim_buf_get_name(0)
		local current_dir
		local cwd = vim.fn.getcwd()
		-- If the buffer is not associated with a file, return nil
		if current_file == '' then
			current_dir = cwd
		else
			current_dir = vim.fn.fnamemodify(current_file, ':h')
		end
		-- Find the Git root directory from the current file's path
		local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
		if vim.v.shell_error ~= 0 then
			print 'Not a git repository. Searching on current working directory'
			return cwd
		end
		return git_root
	end

	local function live_grep_git_root()
		local git_root = find_git_root()
		if git_root then
			builtin.live_grep {
				search_dirs = { git_root },
			}
		end
  end

	vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	}

	pcall(require('telescope').load_extension, 'fzf')
end

return M
