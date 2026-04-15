---@type pluginLazySpec
local spec = {}

spec.setup = function(keys)
    vim.cmd.packadd('harpoon')

    local utils = require('utils')

    local harpoon = utils.lua.require_plugin('harpoon')
    if harpoon == nil then return end

    harpoon:setup({
        settings = {
            key = vim.uv.cwd,
        },
        default = {
            get_root_dir = vim.uv.cwd,
        }
    })

    utils.keys.set_keymaps(keys)
end

spec.keys = {
    {
        modes = 'n',
        lhs = '<leader>h',
        rhs = function() require('harpoon'):list():add() end,
    },
    {
        modes = 'n',
        lhs = '<leader>e',
        rhs = function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end,
    },
    {
        modes = 'n',
        lhs = '<C-h>',
        rhs = function() require('harpoon'):list():select(1) end,
    },
    {
        modes = 'n',
        lhs = '<C-j>',
        rhs = function() require('harpoon'):list():select(2) end,
    },
    {
        modes = 'n',
        lhs = '<C-k>',
        rhs = function() require('harpoon'):list():select(3) end,
    },
    {
        modes = 'n',
        lhs = '<C-l>',
        rhs = function() require('harpoon'):list():select(4) end,
    },
    {
        modes = 'n',
        lhs = '<C-n>',
        rhs = function() require('harpoon'):list():prev() end,
    },
    {
        modes = 'n',
        lhs = '<C-p>',
        rhs = function() require('harpoon'):list():next() end,
    },
}

require('lazy').lazy_load(spec)
