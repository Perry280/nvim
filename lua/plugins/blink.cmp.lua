return {
    "saghen/blink.cmp",
    dependencies = { "folke/lazydev.nvim", },
    version = "1.*",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
        -- "super-tab" for mappings similar to vscode (tab to accept)
        -- "enter" for enter to accept
        -- "none" for no mappings

        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)

        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "default",
            ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
            ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
            -- ["<C-_>"] = { function(cmp) cmp.show() end },
        },

        appearance = { nerd_font_variant = "mono" },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "omni", "cmdline" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            }
        },

        fuzzy = { implementation = "prefer_rust" },

        completion = {
            -- "prefix" will fuzzy match on the text before the cursor
            -- "full" will fuzzy match on the text before _and_ after the cursor
            -- example: "foo_|_bar" will match "foo_" for "prefix" and "foo__bar" for "full"
            keyword = { range = "full" },
            accept = { auto_brackets = { enabled = true }, },
            list = { selection = { preselect = true, auto_insert = true } },
            menu = {
                auto_show = true,
                draw = { treesitter = { "lsp", }, },
            },
            documentation = { auto_show = true },
            ghost_text = { enabled = true },
        },
        cmdline = {
            completion = {
                menu = { auto_show = true },
                list = { selection = { preselect = true, auto_insert = true } },
            },
        },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}
