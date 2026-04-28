require('lazyloading').lazy_load({
    setup = function()
        vim.cmd.packadd('trouble')

        require('trouble').setup({
            focus = true,
            win = {
                type = 'split',
                size = 0.25,
            },
        })
    end,
    keys = {
        {
            modes = 'n',
            lhs = '<leader>tD',
            rhs = '<Cmd>Trouble diagnostics toggle<CR>',
            opts = { desc = 'Trouble: Diagnostics', },
        },
        {
            modes = 'n',
            lhs = '<leader>td',
            rhs = '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
            opts = { desc = 'Trouble: Buffer Diagnostics', },
        },
        {
            modes = 'n',
            lhs = '<leader>ts',
            rhs = '<Cmd>Trouble symbols toggle win.position=right<CR>',
            opts = { desc = 'Trouble: Symbols', },
        },
        {
            modes = 'n',
            lhs = '<leader>tl',
            rhs = '<Cmd>Trouble lsp toggle win.position=right<CR>',
            opts = { desc = 'Trouble: LSP Definitions / references / ...', },
        },
        {
            modes = 'n',
            lhs = '<leader>tL',
            rhs = '<Cmd>Trouble loclist toggle<CR>',
            opts = { desc = 'Trouble: Location List', },
        },
        {
            modes = 'n',
            lhs = '<leader>tQ',
            rhs = '<Cmd>Trouble qflist toggle<CR>',
            opts = { desc = 'Trouble: Quickfix List', },
        },
    },
    cmds = {
        'Trouble',
    },
})
