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

function CreateGitBranch()
    local branchName = vim.fn.input("Enter the new branch name: ")

    print('\n')

    if branchName ~= '' then
        local gitCommand = string.format("git checkout -b %s", branchName)
        vim.fn.system(gitCommand)
        print("Branch created and checked out successfully. " .. branchName)
    else
        print("Invalid branch name. Please provide a valid name.")
    end
end

