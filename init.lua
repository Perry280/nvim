require('config')
require('lsp')

vim.lsp.enable({
    -- 'basedpyright',
    'bashls',
    'clangd',
    'lua_ls',
    'ruff',
    'ty',
})

local user = vim.uv.os_getenv("USER")
if user and user == "root" then
    vim.cmd.colorscheme('catppuccin')
    return
end

require('autocmd')
require('pack')
