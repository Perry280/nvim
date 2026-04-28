require('lazyloading').lazy_load({
    setup = function()
        vim.cmd.packadd('nvim.undotree')
    end,
    keys = {
        {
            modes = 'n',
            lhs = '<leader><F5>',
            rhs = function()
                require('undotree').open({
                    command = require('utils').windows.width(0.2) .. 'vnew'
                })
            end,
            opts = { desc = 'Undotree', }
        },
    },
    cmds = {
        'Undotree',
    },
})
