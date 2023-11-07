local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"javascript",
		"c",
		"sql",
		"typescript",
		"html",
		"css",
		"lua",
		"go",
		"rust",
		"python",
		"vim",
		"vimdoc",
		"query",
		"bash",
		"dockerfile",
		"solidity",
		"tsx",
		"ocaml",
	},
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	auto_install = true,
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})
