require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"lua",
		"css",
		"scss",
		"html",
		"json",
		"jsonc",
		"javascript",
		"typescript",
		"tsx",
		"markdown",
		"svelte",
		"vue",
		"dockerfile",
		"graphql",
		"prisma",
		"pug",
	},

	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		-- max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = { enable = true },
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = false },
	context_commentstring = {
		enable = true,
	},
})
