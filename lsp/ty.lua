---@type vim.lsp.Config
return {
    cmd = { 'ty', 'server' },
    filetypes = { 'python' },
    root_markers = {
        'ty.toml',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        '.git',
        '.venv',
    },
    on_attach = function(client, _)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    ---@type ty.settings
    settings = {
        ty = {
            configuration = {
                rules = {
                    ["unresolved-import"] = "ignore",
                    ["missing-override-decorator"] = "warn",
                    ["missing-type-argument"] = "warn",
                },
                analysis = {
                    ["return-type-inference"] = "always",
                },
            },
        },
    },
    -- ---@type ty.init_options
    -- init_options = {},
}
