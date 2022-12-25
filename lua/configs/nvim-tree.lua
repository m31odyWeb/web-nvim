require("nvim-tree").setup({
	sort_by = "name",
	disable_netrw = true,
	auto_reload_on_write = true,
	hijack_unnamed_buffer_when_opening = false,
	hijack_cursor = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 200,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	view = {
		width = 30,
		hide_root_folder = true,
		side = "left",
		preserve_window_proportions = false,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = false,
		signcolumn = "no",
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		highlight_git = true,
	},
	filters = {
		dotfiles = false,
		custom = { "node_modules", "\\.cache", ".git" },
	},
})
