--- @todo Find a way to clean up the old files and I guess those that have been modifying since 69BC

if vim.fn.has("persistent_undo") then
	local target_path = vim.fn.expand("~/.config/nvim/undo_tree_store")
	-- Create the directory and any parent directories
	-- if the location does not exist.
	if vim.fn.isdirectory(target_path) == 0 then
		vim.fn.mkdir(target_path, "p")
		vim.fn.system("chmod 0700 " .. target_path)
	end

	vim.o.undodir = target_path
	vim.o.undofile = true
end

if vim.g.undotree_ShortIndicators == 1 then
	vim.g.undotree_SplitWidth = 54
else
	vim.g.undotree_SplitWidth = 48
end
vim.g.undotree_WindowLayout = 2

vim.keymap.set("n", "<leader>tu", "<CMD>UndotreeToggle<CR><CMD>UndotreeFocus<CR>")
