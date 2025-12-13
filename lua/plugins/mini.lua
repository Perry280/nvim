return {
    {
        "echasnovski/mini.pairs",
        version = false,
        config = function()
            require("mini.pairs").setup({
                modes = { insert = true, command = true, terminal = false },
                -- skip autopair when next character is one of these
                skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
                -- skip autopair when the cursor is inside these treesitter nodes
                skip_ts = { "string" },
                -- skip autopair when next character is closing pair
                -- and there are more closing pairs than opening pairs
                skip_unbalanced = true,
                -- better deal with markdown code blocks
                markdown = true,
                -- mappings = {
                --     ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
                --     ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
                -- },
            })
        end
    },
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        "echasnovski/mini.comment",
        version = false,
        config = function()
            require("mini.comment").setup()
        end
    },
    {
        "echasnovski/mini.cursorword",
        version = false,
        config = function()
            require("mini.cursorword").setup()
        end
    },
}
