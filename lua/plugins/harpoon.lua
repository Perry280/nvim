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
    config = function(_, opts)
        local harpoon = require("harpoon")
        harpoon:setup(opts)
        local set = require("utils.keymap").set

        set("n", "<leader>h", function() harpoon:list():add() end)
        set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        set("n", "<C-h>", function() harpoon:list():select(1) end)
        set("n", "<C-j>", function() harpoon:list():select(2) end)
        set("n", "<C-k>", function() harpoon:list():select(3) end)
        set("n", "<C-l>", function() harpoon:list():select(4) end)
        set("n", "<C-n>", function() harpoon:list():prev() end)
        set("n", "<C-p>", function() harpoon:list():next() end)
    end,
    keys = {
        -- { "<leader>a", [[:lua require("harpoon"):list():add()<CR>]],                                    mode = "n", noremap = true, silent = true, },
        -- { "<leader>e", [[:lua require("harpoon.ui"):toggle_quick_menu(require("harpoon"):list())<CR>]], mode = "n", noremap = true, silent = true, },
        -- { "<M-h>",     [[:lua require("harpoon"):list():select(1)<CR>]],                                mode = "n", noremap = true, silent = true, },
        -- { "<M-j>",     [[:lua require("harpoon"):list():select(2)<CR>]],                                mode = "n", noremap = true, silent = true, },
        -- { "<M-k>",     [[:lua require("harpoon"):list():select(3)<CR>]],                                mode = "n", noremap = true, silent = true, },
        -- { "<M-l>",     [[:lua require("harpoon"):list():select(4)<CR>]],                                mode = "n", noremap = true, silent = true, },
        -- { "<M-n>",     [[:lua require("harpoon"):list():prev()<CR>]],                                   mode = "n", noremap = true, silent = true, },
        -- { "<M-p>",     [[:lua require("harpoon"):list():next()<CR>]],                                   mode = "n", noremap = true, silent = true, },
        { "<leader>h", mode = "n", },
        { "<leader>e", mode = "n", },
        { "<C-h>",     mode = "n", },
        { "<C-j>",     mode = "n", },
        { "<C-k>",     mode = "n", },
        { "<C-l>",     mode = "n", },
        { "<C-n>",     mode = "n", },
        { "<C-p>",     mode = "n", },
    },
}
