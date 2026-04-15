---@alias MiniPlugins 'ai' | 'align' | 'animate' | 'base16' | 'basics' | 'bracketed' | 'bufremove' | 'clue' | 'cmdline' | 'colors' | 'comment' | 'completion' | 'cursorword' | 'deps' | 'diff' | 'doc' | 'extra' | 'files' | 'fuzzy' | 'git' | 'hipatterns' | 'hues' | 'icons' | 'indentscope' | 'jump' | 'jump2d' | 'keymap' | 'map' | 'misc' | 'move' | 'notify' | 'operators' | 'pairs' | 'pick' | 'sessions' | 'snippets' | 'splitjoin' | 'starter' | 'statusline' | 'surround' | 'tabline' | 'test' | 'trailspace' | 'visits'

---@type table<MiniPlugins, table>
local active_plugins = {
    comment = { options = { ignore_blank_line = true, }, },
    cursorword = { delay = 80, },
    pairs = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = '^[^\\][%s%p%]}]$' },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = '^[^\\][%s%p)}]$' },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = '^[^\\][%s%p)%]]$' },

        [')'] = { action = 'close', pair = '()', neigh_pattern = '^[^\\]' },
        [']'] = { action = 'close', pair = '[]', neigh_pattern = '^[^\\]' },
        ['}'] = { action = 'close', pair = '{}', neigh_pattern = '^[^\\]' },

        ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '^[^\\][%s%p)%]}]$', register = { cr = false } },
        ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '^[^\\][%s%p)%]}]$', register = { cr = false } },
        ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '^[^\\][%s%p)%]}]$', register = { cr = false } },
    },
    surround = { respect_selection_type = true, },
}


vim.g.miniai_disable          = true -- ai
vim.g.minialign_disable       = true -- align
vim.g.minianimate_disable     = true -- animate
vim.g.minibase16_disable      = true -- base16
vim.g.minibasics_disable      = true -- basics
vim.g.minibracketed_disable   = true -- bracketed
vim.g.minibufremove_disable   = true -- bufremove
vim.g.miniclue_disable        = true -- clue
vim.g.minicmdline_disable     = true -- cmdline
vim.g.minicolors_disable      = true -- colors
vim.g.minicomment_disable     = true -- comment
vim.g.minicompletion_disable  = true -- completion
vim.g.minicursorword_disable  = true -- cursorword
vim.g.minideps_disable        = true -- deps
vim.g.minidiff_disable        = true -- diff
vim.g.minidoc_disable         = true -- doc
vim.g.miniextra_disable       = true -- extra
vim.g.minifiles_disable       = true -- files
vim.g.minifuzzy_disable       = true -- fuzzy
vim.g.minigit_disable         = true -- git
vim.g.minihipatterns_disable  = true -- hipatterns
vim.g.minihues_disable        = true -- hues
vim.g.miniicons_disable       = true -- icons
vim.g.miniindentscope_disable = true -- indentscope
vim.g.minijump_disable        = true -- jump
vim.g.minijump2d_disable      = true -- jump2d
vim.g.minikeymap_disable      = true -- keymap
vim.g.minimap_disable         = true -- map
vim.g.minimisc_disable        = true -- misc
vim.g.minimove_disable        = true -- move
vim.g.mininotify_disable      = true -- notify
vim.g.minioperators_disable   = true -- operators
vim.g.minipairs_disable       = true -- pairs
vim.g.minipick_disable        = true -- pick
vim.g.minisessions_disable    = true -- sessions
vim.g.minisnippets_disable    = true -- snippets
vim.g.minisplitjoin_disable   = true -- splitjoin
vim.g.ministarter_disable     = true -- starter
vim.g.ministatusline_disable  = true -- statusline
vim.g.minisurround_disable    = true -- surround
vim.g.minitabline_disable     = true -- tabline
vim.g.minitest_disable        = true -- test
vim.g.minitrailspace_disable  = true -- trailspace
vim.g.minivisits_disable      = true -- visits


local require_plugin = require('utils').lua.require_plugin
---@type table<MiniPlugins, table>
local mini = {}

for plugin, opts in pairs(active_plugins) do
    vim.g['mini' .. plugin .. '_disable'] = false
    mini[plugin] = require_plugin('mini.' .. plugin)
    if mini[plugin] == nil then return end
    mini[plugin].setup(opts)
end
