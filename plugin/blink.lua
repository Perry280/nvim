require('lazyloading').lazy_load({
    setup = function()
        -- vim.cmd.packadd('blink.lib')
        vim.cmd.packadd('blink.lib')
        vim.cmd.packadd('blink.cmp')

        local cmp = require('blink.cmp')
        cmp.build():wait(60000)

        cmp.setup({
            cmdline = {
                keymap = {
                    ['<Tab>'] = { 'show', 'accept' },
                    ['<Left>'] = false,
                    ['<Right>'] = false,
                },
                completion = {
                    menu = { auto_show = true },
                    ghost_text = { enabled = false, },
                },
            },
            completion = {
                keyword = { range = 'full' },
                menu = {
                    draw = {
                        treesitter = { 'lsp', },
                        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', gap = 1, 'kind' } },
                    },
                },
                documentation = { auto_show = true },
            },
            fuzzy = {
                sorts = {
                    'exact',
                    'score',
                    'sort_text',
                },
            },
            keymap = {
                preset = 'default',
                ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
                ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
            },
            signature = { enabled = true },
            sources = {
                default = {
                    'lsp',
                    'path',
                    'snippets',
                    'buffer',
                    -- 'omni',
                    -- 'cmdline',
                },
            },
        })

        -- vim.lsp.config('*', {
        --     -- capabilities = vim.tbl_deep_extend('force',
        --     --     vim.lsp.protocol.make_client_capabilities(),
        --     --     blink.get_lsp_capabilities({}, false)
        --     -- ),
        --     capabilities = cmp.get_lsp_capabilities(),
        -- })
    end,
    events = {
        'LspAttach',
        'CmdlineEnter',
    },
})
