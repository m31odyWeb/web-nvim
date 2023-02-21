require("dressing").setup({
	input = {
		enabled = true,
		default_prompt = "➤ ",
		border = "rounded",
		win_options = {
			winblend = 10,
		},
	},
	select = {
		backend = { "telescope", "builtin", "fzf" },
		win_options = {
			winblend = 10,
			winhighlight = "Normal:Normal,NormalNC:Normal",
		},
	},
})
