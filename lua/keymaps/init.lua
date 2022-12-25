local map = vim.api.nvim_set_keymap

local opts = { noremap = true }

vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Moving lines
map("n", "<leader>j", ":m .+1<CR>", opts)
map("n", "<leader>k", ":m .-2<CR>", opts)
map("v", "<leader>j", ":m '>+1<CR>gv=gv", opts)
map("v", "<leader>k", ":m '<-2<CR>gv=gv", opts)

-- Move to enother window
map("n", "<S-h>", "<cmd>SmartCursorMoveLeft<cr>", opts)
map("n", "<S-l>", "<cmd>SmartCursorMoveRight<cr>", opts)
map("n", "<S-j>", "<cmd>SmartCursorMoveDown<cr>", opts)
map("n", "<S-k>", "<cmd>SmartCursorMoveUp<cr>", opts)

-- Splits
map("n", "<leader>v", ":vsplit<CR>", opts)
map("n", "<leader>h", ":split<CR>", opts)

map("n", "<F7>", "<cmd>ToggleTerm<cr>", opts)
map("t", "<F7>", "<cmd>ToggleTerm<cr>", opts)
--map("i", "jk", "<Esc>", opts)

--map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
--map("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)

--Floatterimal--

--map("n", "<leader>`", ":FloatermToggle<CR>", opts)

--GITSIGNS--
--map("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
--map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--map('n', '<leader>hS', gs.stage_buffer)
--map('n', '<leader>hu', gs.undo_stage_hunk)
--map('n', '<leader>hR', gs.reset_buffer)
--map('n', '<leader>hp', gs.preview_hunk)
--map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--map('n', '<leader>tb', gs.toggle_current_line_blame)
--map('n', '<leader>hd', gs.diffthis)
--map('n', '<leader>hD', function() gs.diffthis('~') end)
--map('n', '<leader>td', gs.toggle_deleted)
--Trouble--
--map("n","<leader>t", ":TroubleToggle<CR>",opts)
