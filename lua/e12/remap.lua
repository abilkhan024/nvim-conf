
vim.keymap.set("n", "<leader>e", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>so", vim.cmd.so)
vim.keymap.set("n", "<leader>c", vim.cmd.bd)
vim.keymap.set("n", "<leader>ho", vim.cmd.noh)

vim.api.nvim_set_keymap('n', '<leader>C', [[:%bd|e#|bd#<CR>'"]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sss', [[:set tabstop=2<CR>:set shiftwidth=2<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ssb', [[:set tabstop=4<CR>:set shiftwidth=4<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", "<cmd>set wrap!<CR>")

vim.keymap.set("n", "<leader>gt", "<cmd>Neotree float git_status<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Depends on git config
--[[
[alias]
    pb = !git push origin $(git symbolic-ref --short HEAD)

    lbf = "!f() { \
        if [ \"$1\" = \"\" ]; then \
            git pull origin $(git symbolic-ref --short HEAD) --no-ff; \
        else \
            git pull origin \"$1\" --no-ff; \
        fi \
    }; f"
    lb = "!f() { \
        if [ \"$1\" = \"\" ]; then \
            git pull origin $(git symbolic-ref --short HEAD); \
        else \
            git pull origin \"$1\"; \
        fi \
    }; f"
    c = checkout
--]]
vim.keymap.set("n", "<leader>gpb", "<cmd>!git pb<CR>")
vim.keymap.set("n", "<leader>gld", "<cmd>!git lb<CR>")
vim.keymap.set("n", "<leader>glf", [[:lua GitCustom('lbf')<CR>]])
vim.keymap.set("n", "<leader>gc", [[:lua GitCustom('c')<CR>]])
-- Depends on git config


function GitCustom(command)
	local user_input = vim.fn.input("git " .. command .." >")
	if user_input ~= "" then
		local git_command = "git  " .. command .. " " .. user_input
		local result = vim.fn.systemlist(git_command)
		if result and #result > 0 then
			vim.cmd("echohl Normal | echomsg 'Git Command Result:' | echohl None")
			vim.cmd("echomsg ''")  -- Add an empty line
			vim.cmd("echomsg ''")  -- Add an empty line
			for _, line in ipairs(result) do
				vim.cmd("echomsg " .. vim.fn.string(line))
			end
		else
			vim.cmd("echo 'No output from Git command.'")
		end
	else
		vim.cmd("echo 'No input provided.'")
	end
end

