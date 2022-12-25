--LOADING OPTIMIZER--
require("impatient")

--UTILS--
require("plenary.async")
require("configs.utils")

--GLOBAL CONFIGS--
require("configs")

--COLOR SCHEME--
require("themes.one-dark")
--[[ require("themes") ]]

--FILE EXPLORERS--
require("configs.nvim-tree")
require("configs.neo-tree")

--COMMENTS--
require("configs.comment")

--KEYMAP HINTING--
require("configs.which-key")

--DASHBOAD--
require("configs.dashboard")

--AUTO PAIRS--
require("configs.autopairs")

--BUFFERLINE--
require("configs.bufferline")

--STATUS LINE--
require("configs.lualine")

--INDENT--
require("configs.indent-blanc-line")
require("configs.indent-o-matic")

--SPLITS--
require("configs.smart-splits")

--TELESCOPE--
require("configs.telescope")

--GIT--
require("configs.git-signs")

--UI ENHANCER--
require("configs.dressing")

--LSP POPUPS--
require("configs.lsp-saga")

--LANGUAGE SERVERS--
require("configs.lsp.mason")
require("configs.lsp.lsp-config")
require("configs.lsp.null-ls")

--HIGHLIGHTING--
require("configs.treesitter")
require("configs.colorizer")

--COMPLITIONS--
require("configs.nvim-cmp")

--KEYMAPPINGS--
require("keymaps")
