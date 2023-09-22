
vim.keymap.set("n", "<leader>e",  "<cmd>Neotree toggle<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>r", vim.cmd.e)
vim.keymap.set("n", "<leader>so", vim.cmd.so)
vim.keymap.set("n", "<leader>c", vim.cmd.bd)
vim.keymap.set("n", "<leader>ho", vim.cmd.noh)

vim.keymap.set("n", "<leader>pa", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.api.nvim_set_keymap('n', '<leader>pp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>C', [[:%bd|e#|bd#<CR>'"]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sss', [[:set tabstop=2<CR>:set shiftwidth=2<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ssb', [[:set tabstop=4<CR>:set shiftwidth=4<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", "<cmd>set wrap!<CR>")

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>")
vim.keymap.set("n", "<leader>gt", "<cmd>Neotree float git_status<CR>")
vim.keymap.set("n", "<leader>pf", "<cmd>Neoformat<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.api.nvim_set_keymap('n', '<leader>bfd', "<cmd>call delete(expand('%')) | bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>brp", function()
	vim.api.nvim_call_function("setreg", {"+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.")})
	vim.cmd("echomsg 'Copied realtive path in clipboard'")
end, {})

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
vim.keymap.set("n", "<leader>glb", [[:lua GitCustom('lb')<CR>]])
vim.keymap.set("n", "<leader>grr", function ()
	local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
	vim.api.nvim_call_function("setreg", {"+", branch })
	vim.cmd("echomsg 'Copied current branch:' " .. vim.fn.string(branch))
end)
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

