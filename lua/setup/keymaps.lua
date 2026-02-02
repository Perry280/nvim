local map = require(".utils.utils").map

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-s>", ":wa<CR>")
map("n", "<C-q>", ":xa<CR>")
map("n", "<leader>bd", ":bd!<CR>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<A-h>", "<C-W>h")
map("n", "<A-j>", "<C-W>j")
map("n", "<A-k>", "<C-W>k")
map("n", "<A-l>", "<C-W>l")

map("t", "<A-h>", "<C-\\><C-N><C-W>h")
map("t", "<A-j>", "<C-\\><C-N><C-W>j")
map("t", "<A-k>", "<C-\\><C-N><C-W>k")
map("t", "<A-l>", "<C-\\><C-N><C-W>l")

map({ "n", "t" }, "<C-Up>", ":resize +2<CR>")
map({ "n", "t" }, "<C-Down>", ":resize -2<CR>")
map({ "n", "t" }, "<C-Right>", ":vertical resize +2<CR>")
map({ "n", "t" }, "<C-Left>", ":vertical resize -2<CR>")

map({ "i", "c", "t" }, "<C-S-h>", "<Del>")
map("n", "ì", ":noh<CR>")

if vim.g.loaded_netrw ~= 1 then
    map("n", "<C-n>", ":Ex<CR>2j")
    map("n", "<leader>N", ":e .<CR>")

    vim.api.nvim_create_autocmd("filetype", {
        pattern = "netrw",
        callback = function()
            local bind = function(lhs, rhs)
                map("n", lhs, rhs, { noremap = false, remap = true, buffer = true, })
            end

            -- edit new file
            bind("n", "%")

            bind("h", "-")
            bind("l", "<CR>")
        end
    })
end
