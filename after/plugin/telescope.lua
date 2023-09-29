local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local custom_actions = {}
function custom_actions.fzf_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()

  if num_selections > 1 then
    local picker = action_state.get_current_picker(prompt_bufnr)
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s", ":e!", entry.value))
    end
  else
    actions.file_edit(prompt_bufnr)
  end
end

require('telescope').setup {
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,
				['<tab>'] = actions.move_selection_previous,
				['<s-tab>'] = actions.move_selection_next,
				['`'] = actions.toggle_selection,
				['<cr>'] = custom_actions.fzf_multi_select,
			},
			n = {
				['<esc>'] = actions.close,
				['<tab>'] = actions.move_selection_previous,
				['<s-tab>'] = actions.move_selection_next,
				['`'] = actions.toggle_selection,
				['<cr>'] = custom_actions.fzf_multi_select,
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

require("telescope").load_extension("ui-select")
