vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i", { desc = "Open terminal in new tab" })
vim.keymap.set("n", "<leader>th", ":split<CR>:terminal<CR>i", { desc = "Open terminal in new horizontal buffer" })
vim.keymap.set("n", "<leader>tv", ":vsplit<CR>:terminal<CR>i", { desc = "Open terminal in new vertical buffer" })

vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>")
end

vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-W>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-W>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-W>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-W>l")


vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "term://*",
    callback = function()
        vim.cmd.startinsert()
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        -- vim.cmd.resize(15)
    end
})
