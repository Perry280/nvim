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

local vim_g                   = vim.g

vim_g.miniai_disable          = true -- ai
vim_g.minialign_disable       = true -- align
vim_g.minianimate_disable     = true -- animate
vim_g.minibase16_disable      = true -- base16
vim_g.minibasics_disable      = true -- basics
vim_g.minibracketed_disable   = true -- bracketed
vim_g.minibufremove_disable   = true -- bufremove
vim_g.miniclue_disable        = true -- clue
vim_g.minicmdline_disable     = true -- cmdline
vim_g.minicolors_disable      = true -- colors
vim_g.minicomment_disable     = true -- comment
vim_g.minicompletion_disable  = true -- completion
vim_g.minicursorword_disable  = true -- cursorword
vim_g.minideps_disable        = true -- deps
vim_g.minidiff_disable        = true -- diff
vim_g.minidoc_disable         = true -- doc
vim_g.miniextra_disable       = true -- extra
vim_g.minifiles_disable       = true -- files
vim_g.minifuzzy_disable       = true -- fuzzy
vim_g.minigit_disable         = true -- git
vim_g.minihipatterns_disable  = true -- hipatterns
vim_g.minihues_disable        = true -- hues
vim_g.miniicons_disable       = true -- icons
vim_g.miniindentscope_disable = true -- indentscope
vim_g.minijump_disable        = true -- jump
vim_g.minijump2d_disable      = true -- jump2d
vim_g.minikeymap_disable      = true -- keymap
vim_g.minimap_disable         = true -- map
vim_g.minimisc_disable        = true -- misc
vim_g.minimove_disable        = true -- move
vim_g.mininotify_disable      = true -- notify
vim_g.minioperators_disable   = true -- operators
vim_g.minipairs_disable       = true -- pairs
vim_g.minipick_disable        = true -- pick
vim_g.minisessions_disable    = true -- sessions
vim_g.minisnippets_disable    = true -- snippets
vim_g.minisplitjoin_disable   = true -- splitjoin
vim_g.ministarter_disable     = true -- starter
vim_g.ministatusline_disable  = true -- statusline
vim_g.minisurround_disable    = true -- surround
vim_g.minitabline_disable     = true -- tabline
vim_g.minitest_disable        = true -- test
vim_g.minitrailspace_disable  = true -- trailspace
vim_g.minivisits_disable      = true -- visits

---@type table<MiniPlugins, table | nil>
local active_plugins          = {
    ai = { silent = true, },
    comment = { options = { ignore_blank_line = true, }, },
    cursorword = { delay = 80, },
    diff = { view = { style = 'sign' }, },
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
    vim_g['mini' .. plugin .. '_disable'] = false

    local m = require('mini.' .. plugin)
    if opts then
        m.setup(opts)
    else
        m.setup()
    end
    -- mini[plugin] = require('mini.' .. plugin)
    -- mini[plugin].setup(opts)
end
