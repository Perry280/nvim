require('config')
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
