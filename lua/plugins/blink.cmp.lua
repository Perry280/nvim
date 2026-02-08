return {
    "saghen/blink.cmp",
    dependencies = { "folke/lazydev.nvim", },
    version = "1.*",
    event = "LspAttach",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            -- ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
            -- ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
        },

        appearance = { nerd_font_variant = "mono" },

        sources = {
            default = { "lazydev", "lsp", --[[ "path", --]] "snippets", "buffer", --[[ "omni", --]] --[[ "cmdline" --]] },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            }
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        completion = {
            keyword = { range = "full" },
            accept = { auto_brackets = { enabled = true }, },
            list = { selection = { preselect = true, auto_insert = true } },
            menu = {
                auto_show = true,
                draw = {
                    treesitter = { "lsp", },
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
                },
            },
            documentation = { auto_show = true },
            ghost_text = { enabled = false },
        },
        cmdline = {
            keymap = {
                ['<Tab>'] = { 'show', 'accept' },
                ["<Left>"] = false,
                ["<Right>"] = false,
            },
            completion = {
                menu = { auto_show = true },
                list = { selection = { preselect = true, auto_insert = true } },
            },
        },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
    keys = { ":", "/", "?", }
}
