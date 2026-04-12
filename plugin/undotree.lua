local size = 0.2

require('utils.keymap').set('n', '<leader><F5>',
    function()
        require('undotree').open({
            command = vim.fn.string(require('utils.window').width(size)) .. 'vnew'
        })
    end
)
