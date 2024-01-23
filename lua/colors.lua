require("srcery").setup({
	transparent_background = true,
	term_colors = true,
	integrations = {
		treesitter = true,
	},
})

require("kanagawa").setup({
	compile = true,
	transparent = true,
})

require("mellifluous").setup({
	dim_inactive = false,
	color_set = "mellifluous",
	transparent_background = {
		enabled = true,
		floating_windows = false,
	},
})

vim.cmd("colorscheme kanagawa")

