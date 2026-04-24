require('lazyloading').lazy_load({
    setup = function()
        -- vim.cmd.packadd('blink.lib')
        vim.cmd.packadd('blink.cmp')
        local blink = require('blink.cmp')

        blink.setup({
            keymap = {
                preset = 'default',
                -- ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
                -- ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
            },
            appearance = { nerd_font_variant = 'mono' },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer', --[['omni',]] --[['cmdline',]] }, },
            fuzzy = {
                implementation = 'prefer_rust_with_warning',
                sorts = {
                    'exact',
                    'score',
                    'sort_text',
                },
            },

            completion = {
                keyword = { range = 'full' },
                accept = { auto_brackets = { enabled = true }, },
                list = { selection = { preselect = true, auto_insert = true } },
                menu = {
                    auto_show = true,
                    draw = {
                        treesitter = { 'lsp', },
                        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', gap = 1, 'kind' } },
                    },
                },
                documentation = { auto_show = true },
                ghost_text = { enabled = false },
            },
            cmdline = {
                keymap = {
                    ['<Tab>'] = { 'show', 'accept' },
                    ['<Left>'] = false,
                    ['<Right>'] = false,
                },
                completion = {
                    menu = { auto_show = true },
                    list = { selection = { preselect = true, auto_insert = true } },
                },
            },
            signature = { enabled = true },
        })

        -- vim.lsp.config('*', {
        --     -- capabilities = vim.tbl_deep_extend('force',
        --     --     vim.lsp.protocol.make_client_capabilities(),
        --     --     blink.get_lsp_capabilities({}, false)
        --     -- ),
        --     capabilities = blink.get_lsp_capabilities(),
        -- })
    end,
    events = {
        'LspAttach',
        'CmdlineEnter',
    },
})
