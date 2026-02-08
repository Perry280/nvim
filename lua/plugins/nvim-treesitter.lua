return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
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
            vim.api.nvim_create_autocmd('FileType', {
                pattern = languages,
                callback = function()
                    vim.treesitter.start()
                    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    -- vim.wo[0][0].foldmethod = 'expr'
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
        config = function()
            local select_to = require("nvim-treesitter-textobjects.select").select_textobject
            local set = require("utils.keymap").set

            set({ "x", "o" }, "am", function() select_to("@function.outer", "textobjects") end)
            set({ "x", "o" }, "im", function() select_to("@function.inner", "textobjects") end)
            set({ "x", "o" }, "ac", function() select_to("@class.outer", "textobjects") end)
            set({ "x", "o" }, "ic", function() select_to("@class.inner", "textobjects") end)
            set({ "x", "o" }, "as", function() select_to("@local.scope", "locals") end)
        end,
    },
}
