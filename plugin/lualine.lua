local lualine = require('utils.plugin').require_plugin('lualine')
if lualine == nil then return end

lualine.setup({
    options = {
        theme = 'auto',
        -- globalstatus = true,
    },
    extensions = {
        -- 'aerial',
        -- 'lazy',
        'neo-tree',
        -- 'nvim-tree',
        'trouble',
    }
})
