function ConfirmDelete()
	local file = vim.fn.expand('%')
	local confirm = vim.fn.input("Delete file " .. file .. "? (y/n): ")
	if confirm == 'y' or confirm == 'Y' then
		vim.fn.delete(file)
		vim.cmd("bdelete!")
	else
		print("File not deleted")
	end
end

