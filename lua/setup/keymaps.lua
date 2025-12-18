vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-S>", "<cmd>wa<CR>")
vim.keymap.set("n", "<C-Q>", "<cmd>xa<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>q<CR>")
vim.keymap.set("n", "<C-N>", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>N", "<cmd>e .<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-U>", "<C-U>zz")
vim.keymap.set("n", "<C-D>", "<C-D>zz")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-Up>",    ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>",  ":resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Left>",  ":vertical resize -2<CR>")
