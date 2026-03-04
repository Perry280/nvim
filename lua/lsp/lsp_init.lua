local lsp_init = {}

---@param features? { autocompletion: boolean, format_on_save: boolean, highlight_words: boolean, inlay_hints: boolean, tab_completion: boolean }
function lsp_init.setup(features)
    features = features or {}

    vim.diagnostic.config({
        float = true,
        virtual_lines = { current_line = true },
        virtual_text = false, -- { current_line = true, },
        severity_sort = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local lsp_features = require("lsp.lsp_features")

            if features.autocompletion then
                lsp_features.autocompletion(args)
            end
            if features.format_on_save then
                lsp_features.format_on_save(args)
            end
            if features.highlight_words then
                lsp_features.highlight_words(args)
            end
            if features.inlay_hints then
                lsp_features.inlay_hints(args)
            end
            if features.tab_completion then
                lsp_features.tab_completion()
            end
        end,
    })
end

---@param LSPs? string | string[]
function lsp_init.enable(LSPs)
    vim.lsp.enable(LSPs or {
        "basedpyright",
        "bashls",
        "clangd",
        "lua_ls",
    })
end

return lsp_init
