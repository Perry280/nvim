local width = require('utils').windows.width

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
                    command = width(0.2) .. 'vnew'
                })
            end,
        },
    },
    cmds = {
        'Undotree',
    },
})
