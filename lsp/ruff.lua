---@type vim.lsp.Config
return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
    capabilities = require("lsp.lsp_features").set_lsp_capabilities(),
    settings = {},
}
