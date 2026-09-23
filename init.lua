vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.ignorecase = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "New line below without insert" })

require("config.lazy")
require("config.treesitter")
require("config.lsp")
require("config.oil")
-- require("config.raddbg")

require("config.custom_commands")
