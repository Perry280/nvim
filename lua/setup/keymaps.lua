local set = require("utils.keymap").set

set("n", "<C-s>", ":wa<CR>", { desc = "Save" })
set("n", "<C-q>", ":xa<CR>", { desc = "Save and quit" })
set("n", "ì", ":noh<CR>", { desc = "Turn off highlight" })
set("n", "<leader>bd", ":bd!<CR>", { desc = "Force close buffer" })

set("n", "n", "nzzzv", { desc = "Next pattern searched and center" })
set("n", "N", "Nzzzv", { desc = "Previous pattern searched and center" })
set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })

set("n", "<M-h>", "<C-W>h", { desc = "Jump to buffer to the left of the current one" })
set("n", "<M-j>", "<C-W>j", { desc = "Jump to buffer below the current one" })
set("n", "<M-k>", "<C-W>k", { desc = "Jump to buffer above the current one" })
set("n", "<M-l>", "<C-W>l", { desc = "Jump to buffer to the right of the current one" })

set("v", "<", "<gv", { desc = "Add a level of indentation to selected lines" })
set("v", ">", ">gv", { desc = "Remove a level of indentation from selected lines" })

set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })

set("t", "<M-h>", "<C-\\><C-N><C-W>h", { desc = "Jump to buffer to the left of the current one" })
set("t", "<M-j>", "<C-\\><C-N><C-W>j", { desc = "Jump to buffer below the current one" })
set("t", "<M-k>", "<C-\\><C-N><C-W>k", { desc = "Jump to buffer above the current one" })
set("t", "<M-l>", "<C-\\><C-N><C-W>l", { desc = "Jump to buffer to the right of the current one" })

set({ "n", "t" }, "<C-Up>", ":resize +2<CR>", { desc = "Increase height of the current window" })
set({ "n", "t" }, "<C-Down>", ":resize -2<CR>", { desc = "Decrease height of the current window" })
set({ "n", "t" }, "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width of the current window" })
set({ "n", "t" }, "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width of the current window" })

set({ "i", "c", "t" }, "<C-S-h>", "<Del>", { desc = "Same as <Del>" })

set({ "i", "c" }, "<M-h>", "<Left>", { desc = "Same as <Left>" })
set({ "i", "c" }, "<M-j>", "<Down>", { desc = "Same as <Down>" })
set({ "i", "c" }, "<M-k>", "<Up>", { desc = "Same as <Up>" })
set({ "i", "c" }, "<M-l>", "<Right>", { desc = "Same as <Right>" })
set({ "i", "c" }, "<M-w>", "<C-o>w", { desc = "Jump to next word" })
set({ "i", "c" }, "<M-b>", "<C-o>b", { desc = "Jump to previous word" })
set({ "i", "c" }, "<M-e>", "<End>", { desc = "Same as <End>" })
set({ "i", "c" }, "<M-0>", "<C-o>0", { desc = "Same as <Home>" })
set({ "i", "c" }, "<M-i>", "<C-o>_", { desc = "Jump to start of the line" })

if vim.g.loaded_netrw ~= 1 then
    set("n", "<C-n>", ":Ex<CR>2j", { desc = "Open netrw in current directory" })
    set("n", "<leader>N", ":e .<CR>", { desc = "Open netrw in root directory" })

    vim.api.nvim_create_autocmd("filetype", {
        pattern = "netrw",
        callback = function()
            local kopts = { noremap = false, remap = true, buffer = true, }
            local bind = function(lhs, rhs, opts)
                if opts == nil then
                    opts = kopts
                else
                    kopts = vim.tbl_deep_extend("force", opts, kopts)
                end

                set("n", lhs, rhs, opts)
            end

            bind("n", "%", { desc = "Create new file" })
            bind("h", "-", { desc = "Go up a directory" })
            bind("l", "<CR>", { desc = "Go down a directory or open a file in a buffer" })
        end
    })
end
