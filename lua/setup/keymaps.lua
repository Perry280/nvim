vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-s>", ":wa<CR>")
vim.keymap.set("n", "<C-q>", ":xa<CR>")
vim.keymap.set("n", "<C-n>", ":Ex<CR>2j")
vim.keymap.set("n", "<leader>N", ":e .<CR>")
vim.keymap.set("n", "<leader>bd", ":bd!<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<A-h>", "<C-W>h")
vim.keymap.set("n", "<A-j>", "<C-W>j")
vim.keymap.set("n", "<A-k>", "<C-W>k")
vim.keymap.set("n", "<A-l>", "<C-W>l")

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")

vim.keymap.set({ "i", "c", "t" }, "<C-S-h>", "<Del>")
vim.keymap.set("n", "ì", ":noh<CR>")

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
        end

        -- edit new file
        bind("n", "%")

        bind("h", "-")
        bind("l", "<CR>")
    end
})
