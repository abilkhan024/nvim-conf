-- Toggle fileexplorer
vim.keymap.set("n", "<leader>e",  "<cmd>Neotree toggle reveal<CR>")
-- Focus fileexplorer
vim.keymap.set("n", "<leader>o",  "<cmd>Neotree reveal<CR>")
-- Write
vim.keymap.set("n", "<leader>w", vim.cmd.w)
-- Quit vim
vim.keymap.set("n", "<leader>q", vim.cmd.q)
-- Quit vim (force)
vim.keymap.set("n", "<leader>Q", '<cmd>q!<CR>')
-- Update file contents to recent (When git modifies file)
vim.keymap.set("n", "<leader>r", vim.cmd.e)
-- Close current buffer
vim.keymap.set("n", "q", vim.cmd.bd)
-- Turnoff search highlight
vim.keymap.set("n", "<leader>ho", vim.cmd.noh)

-- When changin conf
-- Source file
vim.keymap.set("n", "<leader><leader>s", vim.cmd.so)
-- Packer sync
vim.keymap.set("n", "<leader><leader>p", '<cmd>PackerSync<CR>')

vim.keymap.set("n", "<leader>pa", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- Go to prev problem
vim.api.nvim_set_keymap('n', '<leader>pp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
-- Go to next problem
vim.api.nvim_set_keymap('n', '<leader>pn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- Close all buffers except current
vim.api.nvim_set_keymap('n', '<leader>C', [[:%bd|e#|bd#<CR>'"]], { noremap = true, silent = true })
-- Set tabsize 2 - Indent Small
vim.api.nvim_set_keymap('n', '<leader>is', [[:set tabstop=2<CR>:set shiftwidth=2<CR>]], { noremap = true, silent = true })
-- Set tabsize 4 - Indent Big
vim.api.nvim_set_keymap('n', '<leader>ib', [[:set tabstop=4<CR>:set shiftwidth=4<CR>]], { noremap = true, silent = true })
-- Toggle line wrap
vim.keymap.set("n", "<C-w>", "<cmd>set wrap!<CR>")

-- Sessions Find
vim.keymap.set("n", "<leader>sf", "<cmd>SessionManager load_session<CR>")
-- Sessions Last
vim.keymap.set("n", "<leader>sl", "<cmd>SessionManager load_last_session<CR>")
-- Sessions Last
vim.keymap.set("n", "<leader>ss", "<cmd>SessionManager save_current_session<CR>")
-- Sessions Delete
vim.keymap.set("n", "<leader>sd", "<cmd>SessionManager delete_session<CR>")

-- Restart langauge server
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>")
-- Show git status
vim.keymap.set("n", "<leader>gt", "<cmd>Neotree float git_status<CR>")
-- Prettier buffer
vim.keymap.set("n", "<leader>pf", "<cmd>Neoformat<CR>")

-- Move selection down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selection up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate between splits
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")

-- Delete current buffer file
vim.api.nvim_set_keymap('n', '<leader>bd', [[:lua ConfirmDelete()<CR>]], { noremap = true, silent = true })

-- Buffer copy relative path
vim.keymap.set("n", "<leader>brp", function()
	vim.api.nvim_call_function("setreg", {"+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.")})
	vim.cmd("echomsg 'Copied realtive path in clipboard'")
end, {})

-- Git yank current branch name
vim.keymap.set("n", "<leader>gy", function ()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	vim.api.nvim_call_function("setreg", {"+", branch })
	vim.cmd("echomsg 'Copied current branch:' " .. vim.fn.string(branch))
end)

-- Telescope
-- View branches
vim.keymap.set("n", "<leader>gc", '<cmd>Telescope git_branches<CR>')
-- Find changed files in git
vim.keymap.set("n", "<leader>gf", '<cmd>Telescope git_status<CR>')
-- View commits log
vim.keymap.set("n", "<leader>pl", '<cmd>Telescope git_commits<CR>')

