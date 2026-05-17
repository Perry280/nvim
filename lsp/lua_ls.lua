---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua', },
    root_markers = {
        {
            '.emmyrc.json',
            '.luarc.json',
            '.luarc.jsonc',
        },
        {
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml',
        },
        { '.git' },
    },
    ---@type settings.lua_ls
    settings = {
        Lua = {
            codeLens = { enable = true },
            completion = {
                callSnippet = 'Both',
                keywordSnippet = 'Both',
            },
            -- diagnostics = {
            --     neededFileStatus = {
            --         ['codestyle-check'] = 'Any',
            --     },
            -- },
            hint = {
                enable = true,
                semicolon = 'Disable',
            },
            format = {
                enable = true,
                defaultConfig = {
                    call_arg_parentheses = 'always',
                    max_line_length = 100,
                    trailing_table_separator = 'always',

                    space_around_table_field_list = true,

                    align_function_params = false,
                }
            },
            type = {
                checkTableShape = true,
            },
        },
    },
    on_init = function(client, _)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') or (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force',
            client.config.settings.Lua --[[@as table]],
            {
                runtime = {
                    version = 'LuaJIT',
                    path = {
                        'lua/?.lua',
                        'lua/?/init.lua'
                    },
                },
                diagnostics = { globals = { 'vim', }, },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        '${3rd}/luv/library',
                        -- '${3rd}/busted/library',
                        -- vim.fn.stdpath('config'),
                        -- '~/.local/share/nvim/site/pack/core'
                    }
                    -- library = vim.api.nvim_get_runtime_file('', true),
                },
            }
        )
    end,
}
