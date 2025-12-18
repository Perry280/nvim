return {
    -- {
    --     "nvim-mini/mini.pairs",
    --     version = false,
    --     config = function()
    --         require("mini.pairs").setup({
    --             modes = { insert = true, command = false, terminal = false },
    --             mappings = {
    --                 [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    --                 [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    --                 ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    --                 ["("] = { action = "open", pair = "()", neigh_pattern = ".[%s%z%)]", register = { cr = false }, },
    --                 ["["] = { action = "open", pair = "[]", neigh_pattern = ".[%s%z%)}%]]", register = { cr = false }, },
    --                 ["{"] = { action = "open", pair = "{}", neigh_pattern = ".[%s%z%)}%]]", register = { cr = false }, },

    --                 -- Single quote: Prevent pairing if either side is a letter
    --                 ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w\\][^%w]", register = { cr = false }, },
    --                 -- Single quote: Prevent pairing if either side is a letter
    --                 ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\][^%w]", register = { cr = false }, },
    --                 -- Backtick: Prevent pairing if either side is a letter
    --                 ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w\\][^%w]", register = { cr = false }, },
    --             },
    --         })
    --     end
    -- },
    {
        "nvim-mini/mini.surround",
        version = false,
        opts = {
            respect_selection_type = true,
        },
    },
    {
        "nvim-mini/mini.comment",
        version = false,
        opts = {
            options = {
                ignore_blank_line = true,
            },
        },
    },
    {
        "nvim-mini/mini.cursorword",
        version = false,
        config = true,
    },
}
