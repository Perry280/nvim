require('config')
require('autocmd')
require('pack')
require('lsp').setup({
    autocompletion = true,
    format_on_save = true,
})

vim.lsp.enable({
    -- 'basedpyright',
    'bashls',
    'clangd',
    'lua_ls',
    'ruff',
    'ty',
})
