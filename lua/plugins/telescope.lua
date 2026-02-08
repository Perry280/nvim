return {

    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
            }
        })

        local builtin = require("telescope.builtin")
        local set = require("utils.keymap").set

        set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files", })
        set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep", })
        set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers", })
        set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags", })
    end,
}
