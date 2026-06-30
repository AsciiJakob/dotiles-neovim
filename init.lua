vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "New line below without insert" })

require("config.lazy")
require("config.lsp")
require("config.oil")
require("config.raddbg")
