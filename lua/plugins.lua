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

vim.cmd("colorscheme srcery")
