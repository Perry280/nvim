---@type pluginLazySpec
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
            opts = { desc = 'Diagnostics (Trouble)', },
        },
        {
            modes = 'n',
            lhs = '<leader>td',
            rhs = '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
            opts = { desc = 'Buffer Diagnostics (Trouble)', },
        },
        {
            modes = 'n',
            lhs = '<leader>ts',
            rhs = '<Cmd>Trouble symbols toggle win.position=right<CR>',
            opts = { desc = 'Symbols (Trouble)', },
        },
        {
            modes = 'n',
            lhs = '<leader>tl',
            rhs = '<Cmd>Trouble lsp toggle win.position=right<CR>',
            opts = { desc = 'LSP Definitions / references / ... (Trouble)', },
        },
        {
            modes = 'n',
            lhs = '<leader>tL',
            rhs = '<Cmd>Trouble loclist toggle<CR>',
            opts = { desc = 'Location List (Trouble)', },
        },
        {
            modes = 'n',
            lhs = '<leader>tQ',
            rhs = '<Cmd>Trouble qflist toggle<CR>',
            opts = { desc = 'Quickfix List (Trouble)', },
        },
    },
    cmds = {
        'Trouble',
    },
})
