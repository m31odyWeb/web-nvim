local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	--LUA MODULES--
	use("nvim-lua/plenary.nvim")
	use({ "wesleimp/stylua.nvim" })

	--ICONS--
	use("kyazdani42/nvim-web-devicons")

	--UI LIBRARY(POPUPS, INPUTS etc.)--
	use({ "MunifTanjim/nui.nvim" })
	use({ "stevearc/dressing.nvim" })

	--SMART SPLITS--
	use("mrjones2014/smart-splits.nvim")

	--FILE MANAGER--
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
	})

	--LOADING OPTIMIZER--
	use({ "lewis6991/impatient.nvim" })

	--BUFFERS--
	use({ "akinsho/bufferline.nvim" })
	use({ "famiu/bufdelete.nvim" })

	--STATUSLINE--
	use({ "nvim-lualine/lualine.nvim" })

	--INDENT--
	-- Indent detection
	use({ "Darazaki/indent-o-matic" })
	use({ "lukas-reineke/indent-blankline.nvim" })

	--KEYMAPS TOOLTIP--
	use({ "folke/which-key.nvim" })

	--LSP---
	use({ "williamboman/nvim-lsp-installer" })
	use({ "neovim/nvim-lspconfig" })
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use({ "onsails/lspkind.nvim" })

	--HIGHLIGHTING--
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "norcalli/nvim-colorizer.lua" })

	--COMPLITION--
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })

	--SNIPETS--
	--Snippets collection
	use({ "rafamadriz/friendly-snippets" })
	--Snippet engine
	use({ "L3MON4D3/LuaSnip" })
	--Snippet complition source
	use({ "saadparwaiz1/cmp_luasnip" })

	--FORMATTING--
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "jose-elias-alvarez/typescript.nvim" })

	--PACKAGE MANAGER--
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jayp0521/mason-null-ls.nvim" })

	-- FUZZY FINDER--
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	--TERMINAL--
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	--AUTOPAIRS--
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag" })

	--COMMENTS--
	use({ "numToStr/Comment.nvim" })

	--DASHBOARD--
	use({ "glepnir/dashboard-nvim" })

	--GIT--
	use({ "lewis6991/gitsigns.nvim" })
	use({ "kdheepak/lazygit.nvim" })

	--THEMES--
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use({ "navarasu/onedark.nvim" })
	use({ "rebelot/kanagawa.nvim" })
	use({ "folke/tokyonight.nvim" })
	use({ "EdenEast/nightfox.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
