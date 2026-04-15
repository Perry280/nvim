vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('neo-tree').setup({
    sources = {
        'filesystem',
        'buffers',
        'git_status',
        -- 'document_symbols',
    },
    source_selector = {
        winbar = true,
        sources = {
            { source = 'filesystem' },
            { source = 'buffers' },
            { source = 'git_status' },
            -- { source = 'document_symbols' },
        },
    },
    window = {
        mappings = {
            ['<space>'] = 'none',
            ['n'] = 'toggle_node',
            ['o'] = 'open',
            ['oc'] = 'none',
            ['od'] = 'none',
            ['og'] = 'none',
            ['om'] = 'none',
            ['on'] = 'none',
            ['os'] = 'none',
            ['ot'] = 'none',
            ['O'] = 'show_help',
            ['Oc'] = 'order_by_created',
            ['Od'] = 'order_by_diagnostics',
            ['Og'] = 'order_by_git_status',
            ['Om'] = 'order_by_modified',
            ['On'] = 'order_by_name',
            ['Os'] = 'order_by_size',
            ['Ot'] = 'order_by_type',
        }
    },
    -- document_symbols = {
    --     window = {
    --         mappings = {
    --             ['<C-r>'] = 'none',
    --             ['Oc'] = 'none',
    --             ['Od'] = 'none',
    --             ['Og'] = 'none',
    --             ['Om'] = 'none',
    --             ['On'] = 'none',
    --             ['Os'] = 'none',
    --             ['Ot'] = 'none',

    --         }
    --     },

    -- }
})
local set = require('utils').keys.set

set('n', '<leader>nt', '<Cmd>Neotree toggle<CR>')
set('n', '<C-t>', '<Cmd>Neotree reveal<CR>')
set('n', '<leader>nb', '<Cmd>Neotree focus buffers<CR>')
set('n', '<leader>ng', '<Cmd>Neotree focus git_status<CR>')
-- set('n', '<leader>ns', '<Cmd>Neotree focus document_symbols<CR>')
