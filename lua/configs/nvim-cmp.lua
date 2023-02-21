require("luasnip.loaders.from_vscode").lazy_load()
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local symbol_map = {
	NONE = "",
	Array = "",
	Boolean = "⊨",
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	Key = "",
	Namespace = "",
	Null = "NULL",
	Number = "#",
	Object = "⦿",
	Package = "",
	Property = "",
	Reference = "",
	String = "𝓐",
	TypeParameter = "",
	Unit = "",
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.api.nvim_set_hl(0, "MyColor", { bg = "#422042" })

cmp.setup({
	preselect = cmp.PreselectMode.None,

	window = {
		completion = {
			winhighlight = "Normal:DiffChange,FloatBorder:DiffChange,CursorLine:Cursor,Search:Error",
		},
		documentation = {
			winhighlight = "Normal:DiffChange,FloatBorder:DiffChange,Search:None",
		},
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = vim_item.kind

			vim_item.kind = (symbol_map[vim_item.kind] or "?")

			vim_item.menu = "" .. kind .. ""

			local item = entry:get_completion_item()

			if item.detail then
				vim_item.menu = "[" .. vim_item.menu .. "]" .. " 📎 " .. item.detail
			end

			if string.len(vim_item.abbr) >= 30 then
				vim_item.abbr = string.sub(vim_item.abbr, 1, 27) .. "..."
			end

			if string.len(vim_item.menu) >= 30 then
				vim_item.menu = string.sub(vim_item.menu, 1, 27) .. "..."
			end

			return vim_item
		end,
		--[[ format = lspkind.cmp_format({ ]]
		--[[ 	maxwidth = 50, ]]
		--[[ 	symbol_map = symbol_map, ]]
		--[[ 	ellipsis_char = "...", ]]
		--[[ }), ]]
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	dublicates = {
		nvim_lsp = 1,
		luasnip = 1,
		cmp_tabnine = 1,
		buffer = 1,
		path = 1,
	},

	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
