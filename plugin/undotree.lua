local set = require('utils').keys.set

vim.cmd.packadd('nvim.undotree')
local undotree_open = require('undotree').open
local undotree_opts = { command = require('utils').windows.width(0.2) .. 'vnew' }

set('n', '<leader><F5>', function() undotree_open(undotree_opts) end, { desc = 'Undotree', })
