return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        -- "folke/lazydev.nvim",
    },
    enabled = false,
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)

                    -- For `mini.snippets` users:
                    -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                    -- insert({ body = args.body }) -- Insert at cursor
                    -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                    -- require("cmp.config").set_onetime({ sources = {} })
                end,
            },
            window = {
                completion = { border = "bordered" },
                documentation = { border = "bordered" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                -- { name = "lazydev", group_index = 0, },
                { name = "nvim_lsp" },
                { name = "buffer" },
            }
        })
        -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
        -- Set configuration for specific filetype.
        -- cmp.setup.filetype("gitcommit", {
        --     sources = cmp.config.sources(
        --         { { name = "git" }, },
        --         { { name = "buffer" }, }
        --     )
        -- })
        -- require("cmp_git").setup()

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } }
        })

        -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = "path" } },
                { { name = "cmdline" } }
            ),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
}
