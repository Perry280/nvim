return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        init = function()
            vim.opt.foldenable = false
        end,
        config = function()
            local languages = {
                "bash",
                "c",
                "cmake",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "vimdoc",
            }

            require("nvim-treesitter").install(languages)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = languages,
                callback = function()
                    vim.treesitter.start()
                    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo[0][0].foldmethod = "expr"
                    vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                end,
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            vim.g.no_plugin_maps = true
        end,
        opts = {
            select = {
                lookahead = true,
                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "<C-v>",
                },
            },
            move = {
                set_jumps = true,
            },
        },
        config = function()
            local set = require("utils.keymap").set
            local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
            local move = require("nvim-treesitter-textobjects.move")
            local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

            set({ "x", "o" }, "am", function() select_textobject("@function.outer", "textobjects") end)
            set({ "x", "o" }, "im", function() select_textobject("@function.inner", "textobjects") end)
            set({ "x", "o" }, "ac", function() select_textobject("@class.outer", "textobjects") end)
            set({ "x", "o" }, "ic", function() select_textobject("@class.inner", "textobjects") end)
            set({ "x", "o" }, "as", function() select_textobject("@local.scope", "locals") end)

            set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end)
            set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end)
            set({ "n", "x", "o" }, "]o", function() move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects") end)
            set({ "n", "x", "o" }, "]s", function() move.goto_next_start("@local.scope", "locals") end)
            set({ "n", "x", "o" }, "]z", function() move.goto_next_start("@fold", "folds") end)

            set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end)
            set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer", "textobjects") end)

            set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end)
            set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end)

            set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end)
            set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer", "textobjects") end)

            -- Go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            set({ "n", "x", "o" }, "]f", function() move.goto_next("@conditional.outer", "textobjects") end)
            set({ "n", "x", "o" }, "[f", function() move.goto_previous("@conditional.outer", "textobjects") end)

            -- Repeat movement with ; and ,
            -- ensure ; goes forward and , goes backward regardless of the last direction
            set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
            set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)

            -- vim way: ; goes to the direction you were moving.
            -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
            -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

            -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
            set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
            set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
            set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
            set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })
        end,
    },
}
