return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        indent = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },

        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
}
