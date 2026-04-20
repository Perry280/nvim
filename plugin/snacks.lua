require('snacks').setup({
    indent = { -- │
        enabled = true,
        animate = { enabled = false, },
        -- scope = { underline = true, }
    },
    quickfile = {
        enabled = true,
        exclude = {},
    },
    scope = {
        enabled = true,
        treesitter = {
            blocks = { enabled = true, },
        },
    },
    picker = {
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
    rename = { enabled = false, },
    scratch = { enabled = false, },
    scroll = { enabled = false, },
    statuscolumn = { enabled = false, },
    terminal = { enabled = false, },
    toggle = { enabled = false, },
    util = { enabled = false, },
    win = { enabled = false, },
    words = { enabled = false, },
    zen = { enabled = false, },
})

local set = require('utils').keys.set
---@diagnostic disable-next-line: undefined-global
local SP = Snacks.picker
set('n', '<leader>ff', function() SP.smart({ multi = { "files", }, }) end, { desc = 'Snacks: find files', })
set('n', '<leader>fg', SP.grep, { desc = 'Snacks: grep', })
