---@diagnostic disable: undefined-global

---@alias Snacks
---| 'animate'
---| 'bigfile'
---| 'bufdelete'
---| 'dashboard'
---| 'debug'
---| 'dim'
---| 'explorer'
---| 'gh'
---| 'git'
---| 'gitbrowse'
---| 'image'
---| 'indent'
---| 'input'
---| 'keymap'
---| 'layout'
---| 'lazygit'
---| 'notifier'
---| 'notify'
---| 'picker'
---| 'profiler'
---| 'quickfile'
---| 'rename'
---| 'scope'
---| 'scratch'
---| 'scroll'
---| 'statuscolumn'
---| 'terminal'
---| 'toggle'
---| 'util'
---| 'win'
---| 'words'
---| 'zen'

---@type table<Snacks, table>
local opts = {
    explorer = {
        enabled = true,
        replace_netrw = true,
        trash = false,
    },
    indent = { -- │
        enabled = true,
        animate = { enabled = false, },
        -- scope = { underline = true, }
    },
    picker = { enabled = true, },
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
    terminal = { enabled = true, },
}

require('snacks').setup(opts)
local set = require('utils').keys.set

if opts.explorer.enabled then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local SE = Snacks.explorer
    set('n', '<leader>fe', function()
        SE.open({ win = { list = { keys = { ['o'] = false, ['<C-t>'] = false, }, }, }, })
    end, { desc = 'Snacks: explorer', })
end

if opts.picker.enabled then
    local SP = Snacks.picker
    set('n', '<leader>ff', function() SP.smart({ multi = { "files", }, }) end, { desc = 'Snacks: find files', })
    set('n', '<leader>fg', SP.grep, { desc = 'Snacks: grep', })
    set('n', '<leader>fb', SP.buffers, { desc = 'Snacks: buffers', })
    set('n', '<leader>fs', function()
        SP.lsp_symbols({
            layout = {
                preset = "right",
                layout = { width = 1 / 4, },
            },
        })
    end, { desc = 'Snacks: symbols', })
    set('n', '<leader>fr', function()
        SP.lsp_references({
            layout = {
                preset = "bottom",
                layout = { width = 1 / 3, },
            },
        })
    end, { desc = 'Snacks: references', })
    set('n', '<leader>fd', function()
        SP.diagnostics_buffer({
            layout = {
                preset = "bottom",
                layout = { height = 1 / 3, },
            },
        })
    end, { desc = 'Snacks: diagnostics buffer', })
    set('n', '<leader>fD', function()
        SP.diagnostics({
            layout = {
                preset = "bottom",
                layout = { height = 1 / 3, },
            },
        })
    end, { desc = 'Snacks: diagnostics', })
    set('n', '<leader>fG', function()
        SP.git_status({ win = { input = { keys = nil, }, }, })
    end, { desc = 'Snacks: git status', })
end

if opts.terminal.enabled then
    local size = require('utils').windows.fallback_window_size
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
    local ST_open = Snacks.terminal.open
    set('n', '<leader>th', function() ST_open(nil, horizontal_term_opts) end, { desc = 'Snacks: horizonal terminal', })
    set('n', '<leader>tv', function() ST_open(nil, vertical_term_opts) end, { desc = 'Snacks: vertical terminal', })
end
