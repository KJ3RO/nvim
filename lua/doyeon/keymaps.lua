vim.g.mapleader = " "
vim.g.local_mapleader = " "

vim.api.nvim_set_keymap("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

vim.api.nvim_set_keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
