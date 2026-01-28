local root_markers1 = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
}

local root_markers2 = {
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
}

local function root_markers(rm1, rm2)
    return vim.fn.has('nvim-0.11.3') == 1 and { rm1, rm2, { '.git' } } or vim.list_extend(vim.list_extend(rm1, rm2), { '.git' })
end

---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua", },
    root_markers = root_markers(root_markers1, root_markers2),
    capabilities = require("lsp.lsp_init").set_lsp_capabilities(),
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = "Disable" },
            format = {
                enable = true,
                defaultConfig = {
                    max_line_length = "unset",
                }
            }
        },
    },
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath("config") and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")) then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua"
                },
            },
            diagnostics = { globals = { "vim" }, },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- vim.fn.stdpath("config"),
                    -- "${3rd}/luv/library",
                    -- "${3rd}/busted/library",
                }
                -- library = vim.api.nvim_get_runtime_file("", true),
            },
        })
    end,
}
