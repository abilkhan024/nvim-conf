
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>so", vim.cmd.so)
vim.keymap.set("n", "<leader>c", vim.cmd.bd)
vim.api.nvim_set_keymap('n', '<leader>C', [[:%bd|e#|bd#<CR>'"]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", "<cmd>set wrap!<CR>")

vim.keymap.set("n", "<leader>gt", "<cmd>Neotree float git_status<CR>")



