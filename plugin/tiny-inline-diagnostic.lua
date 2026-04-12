local tid = require('utils.plugin').require_plugin('tiny-inline-diagnostic')
if tid == nil then return end

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = false,
    severity_sort = true,
})

tid.setup({
    preset = 'powerline',
})

-- event = 'LspAttach',
