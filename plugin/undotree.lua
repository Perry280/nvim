local size = 0.2
---@type vim.undotree.opts
local opts = { command = require('utils').windows.width(size) .. 'vnew' }

---@type pluginLazySpec
local spec = {}

spec.setup = function()
    vim.cmd.packadd('nvim.undotree')
end

spec.keys = {
    {
        modes = 'n',
        lhs = '<leader><F5>',
        rhs = function() require('undotree').open(opts) end,
    },
}

spec.cmds = {
    'Undotree',
}

require('lazyloading').lazy_load(spec)
