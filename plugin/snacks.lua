---@diagnostic disable: undefined-global
require('snacks').setup({
    indent = { -- │
        enabled = true,
        animate = { enabled = false, },
        -- scope = { underline = true, }
    },
    picker = {
        enabled = true,
    },
    quickfile = {
        enabled = true,
        exclude = {},
    },
    rename = { enabled = true, },
    scope = {
        enabled = true,
        treesitter = {
            blocks = { enabled = true, },
        },
    },
    terminal = {
        enabled = true,
    },

    animate = { enabled = false, },
    bigfile = { enabled = false, },
    bufdelete = { enabled = false, },
    dashboard = { enabled = false, },
    debug = { enabled = false, },
    dim = { enabled = false, },
    explorer = { enabled = false, },
    gh = { enabled = false, },
    git = { enabled = false, },
    gitbrowse = { enabled = false, },
    image = { enabled = false, },
    input = { enabled = false, },
    keymap = { enabled = false, },
    layout = { enabled = false, },
    lazygit = { enabled = false, },
    notifier = { enabled = false, },
    notify = { enabled = false, },
    profiler = { enabled = false, },
    scratch = { enabled = false, },
    scroll = { enabled = false, },
    statuscolumn = { enabled = false, },
    toggle = { enabled = false, },
    util = { enabled = false, },
    win = { enabled = false, },
    words = { enabled = false, },
    zen = { enabled = false, },
})

local set = require('utils').keys.set

-- Picker
local SP = Snacks.picker
set('n', '<leader>ff', function() SP.smart({ multi = { "files", }, }) end, { desc = 'Snacks: find files', })
set('n', '<leader>fg', SP.grep, { desc = 'Snacks: grep', })
set('n', '<leader>fb', SP.buffers, { desc = 'Snacks: buffers', })

local size = 1 / 3
local horizontal_term_opts = {
    win = {
        height = size,
    },
    start_insert = true,
    auto_insert = false,
    auto_close = true,
    interactive = false,
}
local vertical_term_opts = {
    win = {
        width = size,
        position = 'right',
    },
    start_insert = true,
    auto_insert = false,
    auto_close = true,
    interactive = false,
}
local ST = Snacks.terminal
set('n', '<leader>th', function() ST(nil, horizontal_term_opts) end, { desc = 'Snacks: horizonal terminal', })
set('n', '<leader>tv', function() ST(nil, vertical_term_opts) end, { desc = 'Snacks: vertical terminal', })
