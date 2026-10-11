local set = require('utils').keys.set

local harpoon = require('harpoon')
local harpoon_list = harpoon:list()

harpoon:setup({
    settings = {
        key = vim.uv.cwd,
    },
    default = {
        get_root_dir = vim.uv.cwd,
    }
})

set('n', '<leader>h', function() harpoon_list:add() end)
set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(harpoon_list) end)
set('n', '<C-h>', function() harpoon_list:select(1) end)
set('n', '<C-j>', function() harpoon_list:select(2) end)
set('n', '<C-k>', function() harpoon_list:select(3) end)
set('n', '<C-l>', function() harpoon_list:select(4) end)
set('n', '<C-n>', function() harpoon_list:next() end)
set('n', '<C-p>', function() harpoon_list:prev() end)
