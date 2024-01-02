require("bufferline").setup({})

vim.keymap.set("n", "<leader>bs", "<CMD>BufferLinePick<CR>")
vim.keymap.set("n", "<leader>bc", "<CMD>BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<C-S-l>", "<CMD>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<C-S-h>", "<CMD>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>bS", "<CMD>BufferLineSortByRelativeDirectory<CR>")
