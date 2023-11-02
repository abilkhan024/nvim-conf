local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local custom_actions = {}
function custom_actions.fzf_multi_select(prompt_bufnr)
	local success, result = pcall(function()
		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = #picker:get_multi_selection()

		if num_selections > 1 then
			for _, entry in ipairs(picker:get_multi_selection()) do
				vim.cmd(string.format("%s %s", ":e!", entry.value))
			end
		else
			actions.file_edit(prompt_bufnr)
		end
	end)
	if not success then
		actions.select_default()
	end
end

require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<tab>'] = actions.move_selection_previous,
				['<s-tab>'] = actions.move_selection_next,
				['`'] = actions.toggle_selection,
				['<s-CR>'] = custom_actions.fzf_multi_select,
			},
			n = {
				['<esc>'] = actions.close,
				['`'] = actions.toggle_selection,
			},
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown { }
			}
		}
	}
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fF', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fp', builtin.resume, {})
-- Temp solution to find conflicts
vim.keymap.set('n', '<leader>fc', function ()
  local conflict_marker = "^<<<"
  vim.fn.setreg('*', conflict_marker)
  builtin.live_grep({ search = conflict_marker })
end, {})

require("telescope").load_extension("ui-select")
