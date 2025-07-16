return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  event = 'VimEnter',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', build='make' },
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled=vim.g.have_nerd_font },
	},
	config = function()
		require('telescope').setup({
			defaults = {
				path_display = { 'filename_first' },
				mappings = {
					i = {
						['<esc>'] = require('telescope.actions').close
					},
				},
				layout_strategy = 'vertical',
				file_ignore_patterns = { '.git/', 'env/', 'build/', '*.iml', '.settings/', 'logs/', 'node_modules/' }
			},
			extensions = {
				['ui-select'] = { require('telescope.themes').get_dropdown() },
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = 'smart_case',
				}
			}
		})
		pcall(require('telescope').load_extension('ui-select'))
		pcall(require('telescope').load_extension('fzf'))

		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'find [h]elp' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'find [k]eymaps' })
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find [f]iles' })
		vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'find Select Telescope' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'find [b]uffers' })
		vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'find [q]uick fixes' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'find by [g]rep' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'find [d]iagnostics' })
		vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'find [r]esume' })

		vim.keymap.set('n', '<leader>fe', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = 'find [e]ditor files' })

		vim.keymap.set('n', '<leader>f/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = 'find [/] in open files' })
	end
}
