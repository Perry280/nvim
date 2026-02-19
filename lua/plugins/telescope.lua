return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    -- tag = "v0.2.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",

        'nvim-telescope/telescope-ui-select.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = {
                ["ui-select"] = { require("telescope.themes").get_dropdown(), }
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end,
    keys = {
        { "<leader>ff", ":Telescope find_files<CR>", mode = "n", desc = "Telescope find files", noremap = true, silent = true, },
        { "<leader>fg", ":Telescope live_grep<CR>",  mode = "n", desc = "Telescope live grep",  noremap = true, silent = true, },
        { "<leader>fb", ":Telescope buffers<CR>",    mode = "n", desc = "Telescope buffers",    noremap = true, silent = true, },
    },
}
