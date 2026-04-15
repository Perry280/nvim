local lualine = require('utils').lua.require_plugin('lualine')
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
