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
        local map = require(".utils.utils").map

        map("n", "<leader>a", harpoon_list.add)
        map("n", "<leader>e", function() harpoon_ui:toggle_quick_menu(harpoon_list) end)
        map("n", "<C-h>", function() harpoon_list:select(1) end)
        map("n", "<C-j>", function() harpoon_list:select(2) end)
        map("n", "<C-k>", function() harpoon_list:select(3) end)
        map("n", "<C-l>", function() harpoon_list:select(4) end)
        map("n", "<C-S-n>", harpoon_list.next)
        map("n", "<C-S-p>", harpoon_list.prev)
    end,
}
