require("bufferline").setup{}

vim.keymap.set('n', '<leader>bb', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')

