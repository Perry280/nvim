require('config')

local user = vim.uv.os_getenv("USER")
if user and user == "root" then
    return
end

require('autocmd')
require('pack')
require('lsp')

vim.lsp.enable({
    -- 'basedpyright',
    'bashls',
    'clangd',
    'lua_ls',
    'ruff',
    'ty',
})
