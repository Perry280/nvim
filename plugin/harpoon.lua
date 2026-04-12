local harpoon = require('utils.plugin').require_plugin('harpoon')
if harpoon == nil then return end

harpoon:setup({
    settings = {
        key = vim.uv.cwd,
    },
    default = {
        get_root_dir = vim.uv.cwd,
    }
})

local harpoon_list = harpoon:list()
local set = require("utils.keymap").set

set("n", "<leader>h", function() harpoon_list:add() end)
set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon_list) end)
set("n", "<C-h>", function() harpoon_list:select(1) end)
set("n", "<C-j>", function() harpoon_list:select(2) end)
set("n", "<C-k>", function() harpoon_list:select(3) end)
set("n", "<C-l>", function() harpoon_list:select(4) end)
set("n", "<C-n>", function() harpoon_list:prev() end)
set("n", "<C-p>", function() harpoon_list:next() end)
