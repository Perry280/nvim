require('snacks').setup({
    indent = { -- │
        enabled = true,
        animate = { enabled = false, },
        -- scope = { underline = true, }
    },
    scope = { treesitter = { blocks = { enabled = true, }, }, },
    quickfile = { exclude = {}, },
})
