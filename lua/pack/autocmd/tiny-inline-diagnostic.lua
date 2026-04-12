-- vim.api.nvim_create_autocmd('LspAttach', {
--     once = true,
--     callback = function(_)
--         vim.cmd.packadd('tiny-inline-diagnostic.nvim')
--         local tid = require('utils.plugin').require_plugin('tiny-inline-diagnostic')
--         if tid == nil then return end

--         vim.diagnostic.config({
--             virtual_lines = false,
--             virtual_text = false,
--             severity_sort = true,
--         })

--         tid.setup({
--             preset = 'powerline',
--         })
--     end
-- })
