local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	--formatting.eslint_d,
	formatting.stylua,
	--[[ 	formatting.stylelint.with({
		filetypes = {
			"scss",
			"css",
			"sass",
			"postcss",
			"vue",
			"svelte",
		},
	}), ]]
	formatting.prettier.with({
		filetypes = {
			"svelte",
			"html",
			"json",
			"markdown",
			"css",
			"scss",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	}),
	formatting.prismaFmt,
	diagnostics.eslint_d.with({
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
	}),
	diagnostics.stylelint.with({
		filetypes = {
			"scss",
			"css",
			"sass",
			"postcss",
			"html",
			"vue",
			"svelte",
		},
	}),

	code_actions.eslint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
		async = true,
		filter = function(client)
			return client.name == "null-ls"
		end,
	})
end

null_ls.setup({
	sources = sources,
	debug = true,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
