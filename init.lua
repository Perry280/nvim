vim.loader.enable()

_G.on_windows           = vim.uv.os_uname().sysname == "Windows_NT"
_G.user_is_root         = not _G.on_windows and (vim.uv.os_get_passwd() or {}).uid == 0
_G.is_terminal_emulator = vim.uv.os_uname().sysname ~= 'Linux' or (vim.env.TERM ~= nil and vim.env.TERM ~= 'linux')


require('config')
require('lsp')

vim.lsp.enable({
    -- 'bashls',
    'clangd',
    'lua_ls',
    'ruff',
    -- 'rust_analyzer',
    'ty',
})

if _G.user_is_root then
    vim.opt.loadplugins = false
    vim.cmd.runtime('plugin/netrwPlugin.vim')

    local parsers = {
        'c',
        'lua',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
    }
    vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
            if not require('utils').treesitter.lang_for(parsers, args.match) then return end
            vim.treesitter.start()
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
        end,
    })
else
    require('autocmd')
    require('pack')
end
