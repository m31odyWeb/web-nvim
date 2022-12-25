local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_uninstalled = "✗",
			package_pending = "⟳",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"jsonls",
		"sumneko_lua",
		"prismals",
		"svelte",
	},

	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"prettierd",
		"stylua",
		"eslint_d",
		"cspell",
		"stylelint",
		"prismaFmt",
		"refactoring",
	},

	automatic_installation = true,
})
