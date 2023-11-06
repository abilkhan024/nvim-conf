-- Toggle file explorer
vim.keymap.set("n", "<leader>e",  "<cmd>Neotree float toggle reveal<CR>")
-- Escape terminal mode
vim.keymap.set("t", "<esc>",  "<C-\\><C-n>")
-- Focus fileexplorer
vim.keymap.set("n", "<leader>o",  "<cmd>Neotree reveal<CR>")
-- Write
vim.keymap.set("n", "<leader>w", vim.cmd.w)
-- Quit vim
vim.keymap.set("n", "<leader>q", vim.cmd.q)
-- Quit vim (force)
vim.keymap.set("n", "<leader>Q", '<cmd>q!<CR>')
-- Close current buffer
vim.keymap.set("n", "q", vim.cmd.bd)
-- Close current buffer
vim.keymap.set("n", "Q", '<cmd>bdelete!<CR>')
-- Turnoff search highlight
vim.keymap.set("n", "<leader>ho", vim.cmd.noh)
-- Open new terminal session
vim.keymap.set("n", "<leader>tn", '<cmd>terminal<CR>')
-- Delete without coping in register
vim.keymap.set("n", "x", [["_x]], { noremap = true, silent = true })
vim.keymap.set("v", "x", [["_d]], { noremap = true, silent = true })

-- When changin conf
-- Source file
vim.keymap.set("n", "<leader><leader>s", vim.cmd.so)
-- Packer sync
vim.keymap.set("n", "<leader><leader>p", '<cmd>PackerSync<CR>')
-- Mason
vim.keymap.set("n", "<leader><leader>m", '<cmd>Mason<CR>')

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

-- Move between wrapped lines as regular lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '0', 'g0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '$', 'g$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '0', 'g0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '$', 'g$', { noremap = true, silent = true })

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
-- foRmat buffer
vim.keymap.set("n", "<leader>r", "<cmd>Neoformat<CR>", { noremap = true, silent = true })

-- Generate doc comments
vim.keymap.set("n", "gnc", "<cmd>Neogen<CR>")

-- Move selection down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move selection up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps selection after indent
vim.api.nvim_set_keymap('x', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '>', '>gv', { noremap = true, silent = true })

-- Navigate between splits
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")
vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")

-- Delete current buffer file
vim.api.nvim_set_keymap('n', '<leader>bd', [[:lua ConfirmDelete()<CR>]], { noremap = true, silent = true })

-- Copy Project Root path
vim.keymap.set("n", "<leader>br", function()
	local current_directory = vim.fn.getcwd()
	vim.fn.setreg('*', current_directory)
	vim.cmd("echomsg 'Copied project path in clipboard'")
end, {})

-- Buffer copy relative path
vim.keymap.set("n", "<leader>bp", function()
	vim.api.nvim_call_function("setreg", {"+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.")})
	vim.cmd("echomsg 'Copied realtive path in clipboard'")
end, {})

-- Buffer copy file name
vim.keymap.set("n", "<leader>bn", function()
  local current_buffer = vim.fn.bufname("%") -- Get the current buffer's file name
  if current_buffer == nil then
    return
  end
  local file_name = vim.fn.fnamemodify(current_buffer, ":t:r") -- Extract the file name without extension
  vim.fn.setreg("+", file_name) -- Copy the result to the system clipboard register
  vim.cmd('echo "File name copied to clipboard: ' .. file_name .. '"')
end, {})

-- Git yank current branch name
vim.keymap.set("n", "<leader>gy", function ()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	vim.api.nvim_call_function("setreg", {"+", branch })
	vim.cmd("echomsg 'Copied current branch:' " .. vim.fn.string(branch))
end)

-- CamelCaseMotion remaps
vim.api.nvim_set_keymap('n', 'w', '<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'b', '<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'e', '<Plug>CamelCaseMotion_e', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'w', '<Plug>CamelCaseMotion_w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'b', '<Plug>CamelCaseMotion_b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'e', '<Plug>CamelCaseMotion_e', { noremap = true, silent = true })

-- Restore closed buffer
vim.api.nvim_set_keymap('n', 'r', '<C-o>', { noremap = true })
vim.api.nvim_set_keymap('n', 'R', '<C-i>', { noremap = true })

-- Telescope
-- View branches
vim.keymap.set("n", "<leader>gc", '<cmd>Telescope git_branches<CR>')
-- Find changed files in git
vim.keymap.set("n", "<leader>gf", '<cmd>Telescope git_status<CR>')
-- View commits log
vim.keymap.set("n", "<leader>gl", '<cmd>Telescope git_commits<CR>')

