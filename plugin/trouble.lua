local set = require('utils').keys.set

require('trouble').setup({
    focus = true,
    win = {
        type = 'split',
        size = 0.25,
    },
})

set('n', '<leader>tD', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Trouble: Diagnostics', })
set('n', '<leader>td', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Trouble: Buffer Diagnostics', })
set('n', '<leader>ts', '<Cmd>Trouble symbols toggle win.position=right<CR>', { desc = 'Trouble: Symbols', })
set('n', '<leader>tl',
    '<Cmd>Trouble lsp toggle win.position=right<CR>',
    { desc = 'Trouble: LSP Definitions / references / ...' }
)
set('n', '<leader>tL', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Trouble: Location List', })
set('n', '<leader>tQ', '<Cmd>Trouble qflist toggle<CR>', { desc = 'Trouble: Quickfix List', })
