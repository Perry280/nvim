return {
    {
        "nvim-mini/mini.nvim",
        version = false,
        event = "VeryLazy",
        init = function()
            local mini_disable = {
                "ai",
                "align",
                "animate",
                "base16",
                "basics",
                "bracketed",
                "bufremove",
                "clue",
                "cmdline",
                "colors",
                -- "comment",
                "completion",
                -- "cursorword",
                "deps",
                -- "diff",
                "doc",
                "extra",
                "files",
                "fuzzy",
                -- "git",
                "hipatterns",
                "hues",
                "icons",
                "indentscope",
                "jump",
                "jump2d",
                "keymap",
                "map",
                "misc",
                "move",
                "notify",
                "operators",
                "pairs",
                "pick",
                "sessions",
                "snippets",
                "splitjoin",
                "starter",
                "statusline",
                -- "surround",
                "tabline",
                "test",
                "trailspace",
                "visits",
            }
            for _, v in pairs(mini_disable) do vim.g["mini" .. v .. "_disable"] = true end
        end,
        config = function()
            require("mini.comment").setup({ options = { ignore_blank_line = true, }, })
            require("mini.cursorword").setup({ delay = 80, })
            -- require("mini.diff").setup({ view = { style = "sign", signs = { add = "┃", change = "┃", delete = "_" }, }, }) -- ┆
            -- require("mini.git").setup()
            require("mini.surround").setup({ respect_selection_type = true, })
        end,
    },
    -- {
    --     "nvim-mini/mini.surround",
    --     event = "VeryLazy",
    --     version = false,
    --     opts = { respect_selection_type = true, },
    -- },
    -- {
    --     "nvim-mini/mini.comment",
    --     event = "VeryLazy",
    --     version = false,
    --     opts = { options = { ignore_blank_line = true, }, },
    -- },
    -- {
    --     "nvim-mini/mini.cursorword",
    --     event = "VeryLazy",
    --     version = false,
    --     opts = { delay = 100, }
    -- },
}
