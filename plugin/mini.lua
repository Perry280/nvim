---@diagnostic disable: undefined-global

---@alias MiniPlugins
---| 'ai'
---| 'align'
---| 'animate'
---| 'base16'
---| 'basics'
---| 'bracketed'
---| 'bufremove'
---| 'clue'
---| 'cmdline'
---| 'colors'
---| 'comment'
---| 'completion'
---| 'cursorword'
---| 'deps'
---| 'diff'
---| 'doc'
---| 'extra'
---| 'files'
---| 'fuzzy'
---| 'git'
---| 'hipatterns'
---| 'hues'
---| 'icons'
---| 'indentscope'
---| 'input'
---| 'jump'
---| 'jump2d'
---| 'keymap'
---| 'map'
---| 'misc'
---| 'move'
---| 'notify'
---| 'operators'
---| 'pairs'
---| 'pick'
---| 'sessions'
---| 'snippets'
---| 'splitjoin'
---| 'starter'
---| 'statuscolumn'
---| 'statusline'
---| 'surround'
---| 'tabline'
---| 'test'
---| 'trailspace'
---| 'visits'

---@type table<MiniPlugins, table>
local active_plugins = {
    -- ai = { silent = true, },
    comment = { options = { ignore_blank_line = true, }, },
    cursorword = { delay = 80, },
    diff = { -- │
        view = {
            style = 'sign',
            signs = { add = '│', change = '│', delete = '│' },
        },
    },
    icons = {},
    pairs = {
        mappings = {
            ['('] = { action = 'open', pair = '()', neigh_pattern = '^[^\\][^%w%)]$' },
            ['['] = { action = 'open', pair = '[]', neigh_pattern = '^[^\\][^%w%]]$' },
            ['{'] = { action = 'open', pair = '{}', neigh_pattern = '^[^\\][^%w}]$' },

            [')'] = { action = 'close', pair = '()', neigh_pattern = '^[^\\]' },
            [']'] = { action = 'close', pair = '[]', neigh_pattern = '^[^\\]' },
            ['}'] = { action = 'close', pair = '{}', neigh_pattern = '^[^\\]' },

            ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '^[^\\][^%w"]$', register = { cr = false } },
            ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = "^[^\\][^%w']$", register = { cr = false } },
            ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '^[^\\][^%w`]$', register = { cr = false } },
        },
    },
    surround = { respect_selection_type = true, },
    visits = {},
}

for plugin, opts in pairs(active_plugins) do
    require('mini.' .. plugin).setup(opts)
end

local set = require('utils').keys.set

if active_plugins.visits ~= nil then
    local label = 'main'
    set('n', '<leader>a', function() MiniVisits.add_label(label) end, { desc = 'MiniVisits: add label', })
    set('n', '<leader>r', function() MiniVisits.remove_label(label) end, { desc = 'MiniVisits: remove label', })
    set('n', '<leader>p', function()
        MiniVisits.select_path(nil, { filter = label, })
    end, { desc = 'MiniVisits: labeled buffers', })

    set('n', '<C-n>', function()
        MiniVisits.iterate_paths('forward', nil, { filter = label, warp = true, })
    end, { desc = 'MiniVisits: next labeled buffer', })
    set('n', '<C-p>', function()
        MiniVisits.iterate_paths('backward', nil, { filter = label, warp = true, })
    end, { desc = 'MiniVisits: previous labeled buffer', })
end

if active_plugins.icons ~= nil then
    MiniIcons.mock_nvim_web_devicons()
end
