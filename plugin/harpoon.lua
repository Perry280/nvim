local set = require('utils').keys.set

local harpoon = require('harpoon')

harpoon:setup({
    settings = {
        key = vim.uv.cwd,
    },
    default = {
        get_root_dir = vim.uv.cwd,
    }
})

local function list()
    return harpoon:list()
end

set('n', '<leader>h', function() list():add() end)
set('n', '<leader>e', function() harpoon.ui:toggle_quick_menu(list()) end)
set('n', '<C-h>', function() list():select(1) end)
set('n', '<C-j>', function() list():select(2) end)
set('n', '<C-k>', function() list():select(3) end)
set('n', '<C-l>', function() list():select(4) end)
set('n', '<C-n>', function() list():next() end)
set('n', '<C-p>', function() list():prev() end)
