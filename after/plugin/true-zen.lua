require("true-zen").setup({
	modes = { -- configurations per mode
		ataraxis = {
			backdrop = 0,
			minimum_writing_area = { -- minimum size of main widow
				width = math.floor(vim.api.nvim_win_get_width(0) * 0.7),
				height = 10000000,
			},
			padding = {
				left = 52,
				right = 52,
				top = 0,
				bottom = 0,
			},
			options = {
				number = true,
				relativenumber = true,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
		},
	},
})

vim.api.nvim_set_keymap("n", "<leader>az", ":TZAtaraxis<CR>", { noremap = true, silent = true })
