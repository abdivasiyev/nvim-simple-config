vim.g.mapleader = ' '

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- back to directory tree
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- up or down buffer
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- indent selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- switch buffer
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")
vim.keymap.set("n", "<leader>bd", ":bd<CR>")
