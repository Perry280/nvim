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
    vim.api.nvim_create_autocmd('FileType', {
        pattern = {
            'c',
            'lua',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
        },
        callback = function()
            vim.treesitter.start()
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
        end,
    })
    vim.cmd.colorscheme('catppuccin')
    return
end

require('autocmd')
require('pack')
