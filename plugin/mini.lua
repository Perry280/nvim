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
---| 'statusline'
---| 'surround'
---| 'tabline'
---| 'test'
---| 'trailspace'
---| 'visits'

local g                   = vim.g

g.miniai_disable          = true -- ai
g.minialign_disable       = true -- align
g.minianimate_disable     = true -- animate
g.minibase16_disable      = true -- base16
g.minibasics_disable      = true -- basics
g.minibracketed_disable   = true -- bracketed
g.minibufremove_disable   = true -- bufremove
g.miniclue_disable        = true -- clue
g.minicmdline_disable     = true -- cmdline
g.minicolors_disable      = true -- colors
g.minicomment_disable     = true -- comment
g.minicompletion_disable  = true -- completion
g.minicursorword_disable  = true -- cursorword
g.minideps_disable        = true -- deps
g.minidiff_disable        = true -- diff
g.minidoc_disable         = true -- doc
g.miniextra_disable       = true -- extra
g.minifiles_disable       = true -- files
g.minifuzzy_disable       = true -- fuzzy
g.minigit_disable         = true -- git
g.minihipatterns_disable  = true -- hipatterns
g.minihues_disable        = true -- hues
g.miniicons_disable       = true -- icons
g.miniindentscope_disable = true -- indentscope
g.minijump_disable        = true -- jump
g.minijump2d_disable      = true -- jump2d
g.minikeymap_disable      = true -- keymap
g.minimap_disable         = true -- map
g.minimisc_disable        = true -- misc
g.minimove_disable        = true -- move
g.mininotify_disable      = true -- notify
g.minioperators_disable   = true -- operators
g.minipairs_disable       = true -- pairs
g.minipick_disable        = true -- pick
g.minisessions_disable    = true -- sessions
g.minisnippets_disable    = true -- snippets
g.minisplitjoin_disable   = true -- splitjoin
g.ministarter_disable     = true -- starter
g.ministatusline_disable  = true -- statusline
g.minisurround_disable    = true -- surround
g.minitabline_disable     = true -- tabline
g.minitest_disable        = true -- test
g.minitrailspace_disable  = true -- trailspace
g.minivisits_disable      = true -- visits

---@type table<MiniPlugins, table | nil>
local active_plugins      = {
    ai = { silent = true, },
    comment = { options = { ignore_blank_line = true, }, },
    cursorword = { delay = 80, },
    diff = { -- │
        view = {
            style = 'sign',
            signs = { add = '│', change = '│', delete = '│' },
        },
    },
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
    -- statusline = {
    --     content = {
    --         active = nil,
    --         inactive = nil,
    --     },
    --     use_icons = true,
    -- },
    surround = { respect_selection_type = true, },
}

-- ---@type table<MiniPlugins, table>
-- local mini = {}

for plugin, opts in pairs(active_plugins) do
    g['mini' .. plugin .. '_disable'] = false

    local m = require('mini.' .. plugin)
    if opts then
        m.setup(opts)
    else
        m.setup()
    end
    -- mini[plugin] = require('mini.' .. plugin)
    -- mini[plugin].setup(opts)
end
