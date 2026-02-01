return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", },
    lazy = true,
    opts = {
        settings = {
            key = vim.uv.cwd,
        },
        default = {
            get_root_dir = vim.uv.cwd,
        }
    },
    config = function()
        local harpoon_ui = require("harpoon.ui")
        local harpoon_list = require("harpoon"):list()
        local kopts = {
            silent = true,
            noremap = true,
        }

        vim.keymap.set("n", "<leader>a", harpoon_list.add, kopts)
        vim.keymap.set("n", "<leader>e", function() harpoon_ui:toggle_quick_menu(harpoon_list) end)
        vim.keymap.set("n", "<C-h>", function() harpoon_list:select(1) end, kopts)
        vim.keymap.set("n", "<C-j>", function() harpoon_list:select(2) end, kopts)
        vim.keymap.set("n", "<C-k>", function() harpoon_list:select(3) end, kopts)
        vim.keymap.set("n", "<C-l>", function() harpoon_list:select(4) end, kopts)
        vim.keymap.set("n", "<C-S-n>", harpoon_list.next, kopts)
        vim.keymap.set("n", "<C-S-p>", harpoon_list.prev, kopts)
    end,
}
