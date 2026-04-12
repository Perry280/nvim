local snacks = require('utils.plugin').require_plugin('snacks')
if snacks == nil then return end

snacks.setup({
    indent = { -- │
        enabled = true,
        animate = { enabled = false, },
        -- scope = { underline = true, }
    },
    scope = { treesitter = { blocks = { enabled = true, }, }, },
    quickfile = { exclude = {}, },
})
