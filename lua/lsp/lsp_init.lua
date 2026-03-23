local lsp_init = {}

---@alias features { autocompletion: boolean, format_on_save: boolean, highlight_words: boolean, inlay_hints: boolean, tab_completion: boolean }

---@param features? features
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
            local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
            local lsp_features = require("lsp.lsp_features")

            for k, _ in ipairs(features) do
                if k ~= "tab_completion" and features[k] then
                    lsp_features[k](args, client)
                end
            end

            if features.tab_completion then
                lsp_features.tab_completion()
            end
        end,
    })
end

---@param LSPs? string | string[]
function lsp_init.enable(LSPs)
    local lsps = {
        "basedpyright",
        "bashls",
        "clangd",
        "lua_ls",
    }
    vim.lsp.enable(LSPs or lsps)
end

return lsp_init
