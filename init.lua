require('config')
require('pack')
require('lsp').setup({
    autocompletion = true,
    format_on_save = true,
})

vim.cmd.colorscheme('catppuccin-mocha')

vim.lsp.enable({
    -- 'basedpyright',
    'bashls',
    'clangd',
    'lua_ls',
    'ruff',
    'ty',
})
