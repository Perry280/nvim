local utils = require('utils')

local size = 0.2
---@type vim.undotree.opts
local opts = { command = utils.windows.width(size) .. 'vnew' }

---@type pluginLazySpec
local spec = {}

spec.setup = function(keys)
    vim.cmd.packadd('nvim.undotree')
    utils.keys.set_keymaps(keys)
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
