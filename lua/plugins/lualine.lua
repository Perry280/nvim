return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "auto",
            globalstatus = true,
        },
        extensions = {
            -- "aerial",
            "lazy",
            "neo-tree",
            -- "nvim-tree",
            -- "trouble",
        }
    },
}
