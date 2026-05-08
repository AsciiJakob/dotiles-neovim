vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", { desc = "Save file" })

require("config.lazy")

