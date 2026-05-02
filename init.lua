require('config')

if vim.uv.os_getenv("USER") == "root" then
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
