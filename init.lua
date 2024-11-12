require("core.options")
require("core.keymaps")

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.tmux"),
	require("plugins.treesiter"),
	require("plugins.telescope"),
	require("plugins.lualine"),
	require("plugins.colortheme"),
	require("plugins.gitsigns"),
	require("plugins.harpoon"),
	require("plugins.alpha"),
	require("plugins.lsp"),
	require("plugins.none-ls"),
	require("plugins.autocomplete"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
})
