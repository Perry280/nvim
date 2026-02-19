return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        indent = { -- │
            enabled = true,
            animate = { enabled = false, },
            -- scope = { underline = true, }
        },
        scope = { treesitter = { blocks = { enabled = true, }, }, },
        quickfile = { exclude = {}, },
    },
}
