return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        indent = { -- │
            enabled = true,
            animate = { enabled = false, },
            -- scope = { underline = true, }
        },
        scope = { treesitter = { blocks = { enabled = true, }, }, },
        quickfile = { exclude = {}, },
        -- terminal = { enabled = true, }
    },
}
