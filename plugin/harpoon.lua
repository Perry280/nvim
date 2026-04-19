---@type pluginLazySpec
local spec = {}

spec.setup = function()
    vim.cmd.packadd('harpoon')

    require('harpoon'):setup({
        settings = {
            key = vim.uv.cwd,
        },
        default = {
            get_root_dir = vim.uv.cwd,
        }
    })
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

require('lazyloading').lazy_load(spec)
