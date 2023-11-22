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

function GetLspRootDir()
  local git_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
  if git_dir then
    return git_dir
  end
  return vim.fn.getcwd()
end


--- Utility function to create markdown file for today
function TodaysNote()
  local currentDate = os.date("%d-%m-%Y")
  local relativeDir = vim.fn.input("Enter relative dir: ", '', 'file')
  if relativeDir ~= '' or relativeDir ~= '/'  then
    return print('Exting todays note prompt')
  end
  local fileName = relativeDir .. "/" .. currentDate .. ".md"
  local file, error_message = io.open(fileName, "w")
  print('\n')
  if file then
    file:write("# " .. currentDate)
    file:close()

    print("File created successfully: " .. fileName)
  else
    print("Error creating file: " .. error_message)
  end
end

