---@diagnostic disable-next-line: undefined-global
if lsp_init then return end
local lsp_init = {}

function lsp_init.setup()
    vim.diagnostic.config({
        float = true,
        virtual_lines = { current_line = true },
        virtual_text = false, -- { current_line = true, },
        severity_sort = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local lsp_features = require("lsp.lsp_features")

            lsp_features.autocompletion(args)
            lsp_features.format_on_save(args)
            -- lsp_features.highlight_words(args)
            -- lsp_features.inlay_hints(args)
            -- lsp_features.tab_completion()
        end,
    })
end

---@param capabilities? lsp.ClientCapabilities
---@param use_built_in_capabilities? boolean = false
---@return lsp.ClientCapabilities
function lsp_init.set_lsp_capabilities(capabilities, use_built_in_capabilities)
    capabilities = capabilities or {}

    if use_built_in_capabilities or false then
        capabilities = vim.tbl_deep_extend("force",
            capabilities,
            vim.lsp.protocol.make_client_capabilities()
        )
    end

    capabilities = vim.tbl_deep_extend("force",
        capabilities,
        require('blink.cmp').get_lsp_capabilities({}, false)
    )

    ---@diagnostic disable-next-line: return-type-mismatch
    return capabilities
end

return lsp_init
