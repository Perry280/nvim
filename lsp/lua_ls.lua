---@type string[]
local root_markers1 = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
}

---@type string[]
local root_markers2 = {
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
}

---@param rm1 string[]
---@param rm2 string[]
---@return (string | string[])[]
local function root_markers(rm1, rm2)
    return vim.fn.has('nvim-0.11.3') == 1
        and { rm1, rm2, { '.git' } }
        or vim.list_extend(vim.list_extend(rm1, rm2), { '.git' })
end

---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua', },
    root_markers = root_markers(root_markers1, root_markers2),
    settings = {
        Lua = {
            codeLens = { enable = true },
            completion = {
                callSnippet = 'Both',
                keywordSnippet = 'Both',
            },
            diagnostics = {
                -- neededFileStatus = {
                --     ['codestyle-check'] = 'Any',
                -- },
            },
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
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                return
            end
        end

        ---@diagnostic disable-next-line: param-type-mismatch
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
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
                }
                -- library = vim.api.nvim_get_runtime_file('', true),
            },
        })
    end,
}
