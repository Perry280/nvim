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
    end
    -- settings = {
    --     ty = {
    --         configuration = {

    --         },
    --     },
    -- },
}
