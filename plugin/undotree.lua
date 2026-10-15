local set = require('utils').keys.set

vim.cmd.packadd('nvim.undotree')
local undotree_open = require('undotree').open

set('n', '<leader><F5>', function()
    undotree_open({ command = require('utils').windows.width(0.2) .. 'vnew' })
end, { desc = 'Undotree' })
