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
        local function opts(desc)
            return {
                desc = desc,
                silent = true,
                noremap = true,
            }
        end

        vim.keymap.set("n", "<leader>ff", builtin.find_files, opts("Telescope find files"))
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts("Telescope live grep"))
        vim.keymap.set("n", "<leader>fb", builtin.buffers, opts("Telescope buffers"))
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts("Telescope help tags"))
    end,
}
