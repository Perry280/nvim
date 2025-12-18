vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i")
vim.keymap.set("n", "<leader>tb", ":split<CR>:terminal<CR>i")

vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>")


vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-W>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-W>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-W>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-W>l")


vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "term://*",
    callback = function()
        vim.cmd("startinsert")
    end,
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
--     pattern = "term://*",
--     callback = function()
--         vim.cmd("startinsert")
--     end,
-- })

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.signcolumn = "no"
    end
})
