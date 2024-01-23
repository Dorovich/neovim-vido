opt = vim.opt
g = vim.g
keymap = vim.keymap.set
autocmd = vim.api.nvim_create_autocmd
file_name = vim.fn.expand("%:t:r")

-- Settings

g.mapleader = ","

opt.scrolloff = 1
opt.sidescrolloff = 1
opt.laststatus = 0
opt.splitright = true
opt.splitbelow = true
opt.lazyredraw = true

-- Keys

keymap("n", "ñ", ":", nil)
keymap("n", "U", "<c-r>", nil)
keymap("x", ">", ">gv", {silent=true})
keymap("x", "<", "<gv", {silent=true})

keymap("n", "<leader>t", ":split<cr>:term<cr>A", nil)
keymap("n", "<leader>r", ":%s//g<left><left>", nil)
keymap("n", "<leader>c", ":!make<cr>", nil)

-- Autocmds

autocmd({ "FileType" }, {
	pattern = { "text", "org", "markdown" },
	callback = function()
		opt.wrap = true
	end
})

autocmd({ "TermEnter" }, {
	callback = function()
		opt.number = false
		opt.relativenumber = false
	end
})

autocmd({ "TermClose" }, {
	command = "call nvim_input('<cr>')"
})

-- Plugins

local lazypath = vim.fn.stdpath "data".."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"rebelot/kanagawa.nvim",
	"DanisDGK/srcery.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate"
	}
}, {})

require("plugins")
