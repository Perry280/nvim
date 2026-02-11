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

        set("n", "<leader>a", function() harpoon:list():add() end)
        set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        set("n", "<M-h>", function() harpoon:list():select(1) end)
        set("n", "<M-j>", function() harpoon:list():select(2) end)
        set("n", "<M-k>", function() harpoon:list():select(3) end)
        set("n", "<M-l>", function() harpoon:list():select(4) end)
        set("n", "<M-n>", function() harpoon:list():prev() end)
        set("n", "<M-p>", function() harpoon:list():next() end)
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
        { "<leader>a", mode = "n", },
        { "<leader>e", mode = "n", },
        { "<M-h>",     mode = "n", },
        { "<M-j>",     mode = "n", },
        { "<M-k>",     mode = "n", },
        { "<M-l>",     mode = "n", },
        { "<M-n>",     mode = "n", },
        { "<M-p>",     mode = "n", },
    },
}
