local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<C-s>", ":wa<CR>", opts)
vim.keymap.set("n", "<C-q>", ":xa<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bd!<CR>", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<A-h>", "<C-W>h", opts)
vim.keymap.set("n", "<A-j>", "<C-W>j", opts)
vim.keymap.set("n", "<A-k>", "<C-W>k", opts)
vim.keymap.set("n", "<A-l>", "<C-W>l", opts)

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)

vim.keymap.set({ "i", "c", "t" }, "<C-S-h>", "<Del>", opts)
vim.keymap.set("n", "ì", ":noh<CR>", opts)

if vim.g.loaded_netrw ~= 1 then
    vim.keymap.set("n", "<C-n>", ":Ex<CR>2j", opts)
    vim.keymap.set("n", "<leader>N", ":e .<CR>", opts)

    vim.api.nvim_create_autocmd("filetype", {
        pattern = "netrw",
        callback = function()
            local bind = function(lhs, rhs)
                vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true, silent = true, })
            end

            -- edit new file
            bind("n", "%")

            bind("h", "-")
            bind("l", "<CR>")
        end
    })
end
