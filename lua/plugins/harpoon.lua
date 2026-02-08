return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", },
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
        local set = require("utils.keymap").set

        set("n", "<leader>a", function() harpoon_list:add() end)
        set("n", "<leader>e", function() harpoon_ui:toggle_quick_menu(harpoon_list) end)
        set("n", "<C-h>", function() harpoon_list:select(1) end)
        set("n", "<C-j>", function() harpoon_list:select(2) end)
        set("n", "<C-k>", function() harpoon_list:select(3) end)
        set("n", "<C-l>", function() harpoon_list:select(4) end)
        set("n", "<C-S-n>", function() harpoon_list:next() end)
        set("n", "<C-S-p>", function() harpoon_list:prev() end)
    end,
}
