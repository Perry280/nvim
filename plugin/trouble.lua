local trouble = require('utils.plugin').require_plugin('trouble')
if trouble == nil then return end

trouble.setup({
    focus = true,
    win = {
        type = 'split',
        size = 1 / 4,
    },
})

local set = require('utils.keymap').set

set('n', '<leader>tD', ':Trouble diagnostics toggle<CR>', { desc = 'Diagnostics (Trouble)', })
set('n', '<leader>td', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Buffer Diagnostics (Trouble)', })
set('n', '<leader>ts', ':Trouble symbols toggle win.position=right<CR>', { desc = 'Symbols (Trouble)', })
set('n', '<leader>tl', ':Trouble lsp toggle win.position=right<CR>', { desc = 'LSP Definitions / references / ... (Trouble)', })
set('n', '<leader>tL', ':Trouble loclist toggle<CR>', { desc = 'Location List (Trouble)', })
set('n', '<leader>tQ', ':Trouble qflist toggle<CR>', { desc = 'Quickfix List (Trouble)', })

-- cmd = 'Trouble',
