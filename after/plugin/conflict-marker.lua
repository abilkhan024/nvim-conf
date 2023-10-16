-- Disable the default highlight group
vim.g.conflict_marker_highlight_group = ''

-- Include text after begin and end markers
vim.g.conflict_marker_begin = '^<<<<<<< .*$'
vim.g.conflict_marker_end = '^>>>>>>> .*$'

-- Highlight definitions
vim.cmd('highlight ConflictMarkerBegin guibg=#2f7366')
vim.cmd('highlight ConflictMarkerOurs guibg=#2e5049')
vim.cmd('highlight ConflictMarkerTheirs guibg=#344f69')
vim.cmd('highlight ConflictMarkerEnd guibg=#2f628e')
vim.cmd('highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81')

-- Define a single function to check for Git merge conflict markers and set mappings
function CheckAndRemapConflict()
    local lines = vim.fn.getline(1, '$')
    local has_conflicts = false

    for _, line in ipairs(lines) do
        if vim.fn.match(line, '^[<=>][<=>][<=>][<=>][<=>][<=>][<=>][<=>]') ~= -1 then
            has_conflicts = true
            break
        end
    end

    if has_conflicts then
        -- Remap the '[' key to your specific command
        vim.api.nvim_buf_set_keymap(0, 'n', '[', ':ConflictMarkerPrevHunk<CR>', { noremap = true, silent = true })

        -- Remap the ']' key to another specific command
        vim.api.nvim_buf_set_keymap(0, 'n', ']', ':ConflictMarkerNextHunk<CR>', { noremap = true, silent = true })
    end
end

-- Add an autocmd for the BufEnter event to call the check_and_remap function
vim.cmd([[
    augroup buffer_mappings
        autocmd!
        autocmd BufEnter * lua CheckAndRemapConflict()
    augroup END
]])
