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
                    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
            require("nvim-treesitter-textobjects").setup()
        end,
    }
}
