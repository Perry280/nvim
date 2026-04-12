local undotree = require('undotree')

local size = 0.2
local cmd = vim.fn.string(require('utils.window').width(size)) .. 'vnew'

require('utils.keymap').set('n', '<leader><F5>', function() undotree.open({ command = cmd }) end)
