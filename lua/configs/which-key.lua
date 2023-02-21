local wk = require("which-key")

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

local mappings = {
	["w"] = { "<cmd>w!<CR>", "Save" },
	G = {
		name = "Global commands",
		c = { "<cmd>!npm run fix:code<cr>", "Fix code problems(npm run fix:code)" },
		s = { "<cmd>!npm run fix:styles<cr>", "Fix styles problems(npm run fix:styles)" },
		f = { "<cmd>!npm run format<cr>", "Format(npm run format)" },
		a = { "<cmd>!npm run fix:and:format<cr>", "Fix all problems and format(npm run fix:and:format)" },
	},
	x = {
		name = "Global commands",
		x = {
			"<cmd>Format<CR>",
			"Format buffer",
		},
	},

	["s"] = { "<cmd>:noautocmd w<CR>", "Save without formating" },
	["q"] = { "<cmd>lua require('configs.utils').smart_quit()<CR>", "Quit" },
	["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
	["1"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous tab" },
	["2"] = { "<cmd>BufferLineCycleNext<CR>", "Next tab" },
	-- ["c"] = { "<cmd>lua require('configs.utils').buf_kill()<CR>", "Close tab" },
	["c"] = { "<cmd>Bdelete<CR>", "Close current buffer" },
	e = {
		name = "Explorer",
		e = { "<cmd>NvimTreeToggle<cr>", "Open/hide explorer" },
		f = { "<cmd>NvimTreeFocus<cr>", "Focus explorer" },
		c = { "<cmd>NvimTreeCollapse<cr>", "Collaps" },
		r = { "<cmd>NvimTreeRefresh<cr>", "Refresh explorer" },
	},

	n = {
		name = "Neo tree",
		n = { "<cmd>Neotree toggle<cr>", "Toggle and jump to explorer" },
		b = { "<cmd>Neotree buffers<cr>", "Show buffers" },
		f = { "<cmd>Neotree filesystem<cr>", "Show filesystem" },
		s = { "<cmd>Neotree show<cr>", "Show explorer" },
	},

	f = {
		name = "File", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" }, -- create a binding with label
		g = { "<cmd>Telescope live_grep<cr>", "Live grep" }, -- create a binding with label
		s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in current file" }, -- create a binding with label
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		--["1"] = "which_key_ignore",  -- special label to hide it in the popup
	},

	g = {
		name = "GIT",
		g = { "<cmd>LazyGit<cr>", "Open LazyGit" },
		b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
		s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff" },
		R = {
			name = "RESET",
			r = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
		},
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	b = {
		name = "Buffers",
		a = { "<cmd>Bwipeout<cr>", "Close all buffers" },
		c = { "<cmd>Bdelete<cr>", "Close current buffer" },
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
		e = {
			"<cmd>BufferLinePickClose<cr>",
			"Pick which buffer to close",
		},
		l = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
		r = {
			"<cmd>BufferLineCloseRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferLineSortByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferLineSortByExtension<cr>",
			"Sort by language",
		},
	},
	h = {
		name = "LSP Saga",
		f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
		a = { "<cmd>Lspsaga code_action<CR>", "Actions" },
		r = { "<cmd>Lspsaga rename<CR>", "Rename" },
		d = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show float diagnostics" },
		h = { "<cmd>Lspsaga hover_doc<CR>", "Doc" },
		s = { "<cmd>Lspsaga peek_definition<CR>", "Definition" },
		l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics" },
		p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev diagnostic" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic" },
		o = { "<cmd>LSoutlineToggle<CR>", "Show outline" },
	},
	l = {
		name = "LSP",
		a = { vim.lsp.buf.code_action, "Code Action" },
		d = { vim.lsp.buf.definition, "Go to definition" },
		D = { vim.lsp.buf.declaration, "Go to declaration" },
		i = { vim.lsp.buf.implementation, "Go to implementation" },
		s = { vim.lsp.buf.signature_help, "Signature help" },
		t = { vim.lsp.buf.type_definition, "Type definition" },
		h = { vim.lsp.buf.hover, "Hover" },
		r = { vim.lsp.buf.rename, "Rename" },
		b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		l = {
			'<cmd>lua vim.diagnostic.open_float({ border = "rounded", focusable = false, close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" }, source = "always", prefix = " ", scope = "cursor" })<CR>',
			"Show diagnostics in hover window",
		},
		j = { vim.diagnostic.goto_next, "Next Diagnostic" },
		k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
		o = {
			name = "Other",
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			l = { vim.lsp.codelens.run, "CodeLens Action" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = {
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				"Workspace Symbols",
			},
			e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
		},
	},

	C = {
		name = "Config",
		r = { "<cmd>luafile %<CR>", "Reload config" },
	},
	p = {
		name = "Project commands",
		e = { "<cmd>!npm run lint:es:fix<cr>", "Eslint fix" },
		s = { "<cmd>!npm run lint:css:fix<cr>", "Stylelint fix" },
	},
}

wk.register(mappings, opts)
