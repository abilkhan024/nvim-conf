local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.999,
      preview_width = 0.5
    },
    file_ignore_patterns = { "node_modules", ".git" },
    mappings = {
      i = {
        ['<Up>'] = actions.move_selection_previous,
        ['<Down>'] = actions.move_selection_next,
        ['<Tab>'] = actions.toggle_selection,
        ['<s-CR>'] = actions.send_to_qflist,
        ['<esc>'] = actions.close,
        ['<s-Tab>'] = require('telescope.actions.layout').toggle_preview
      },
    },
    preview = {
      hide_on_startup = true -- hide previewer when picker starts
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
vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})

-- Temp solution to find conflicts
vim.keymap.set('n', '<leader>fc', function ()
  local conflict_marker = "^<<<"
  vim.fn.setreg('*', conflict_marker)
  builtin.live_grep({ search = conflict_marker })
end, {})

require("telescope").load_extension("ui-select")
