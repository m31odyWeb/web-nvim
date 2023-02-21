local set = vim.opt

set.termguicolors = true

set.relativenumber = true
set.number = true

set.cursorline = true

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.autoindent = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true

set.wrap = false
set.scrolloff = 8
set.fileencoding = "utf-8"

set.hidden = true

set.mouse = "a"

set.swapfile = false

set.timeoutlen = 100

vim.api.nvim_exec([[ au BufRead,BufNewFile tsconfig.json set filetype=jsonc ]], false)

local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
		if { row, col } ~= { 0, 0 } then
			vim.api.nvim_win_set_cursor(0, { row, 0 })
		end
	end,
	group = group,
})

local format = function()
	vim.lsp.buf.format({
		bufnr = vim.api.nvim_get_current_buf(),
		async = false,
		timeout_ms = 2000,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

vim.api.nvim_create_user_command("Format", format, { nargs = "?" })
