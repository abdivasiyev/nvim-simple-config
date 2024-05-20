vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- back to directory tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
