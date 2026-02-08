local lsp_init = {}

function lsp_init.setup()
    local diag = {
        float = true,
        virtual_lines = { current_line = true },
        virtual_text = false, -- { current_line = true, },
        severity_sort = true,
    }
    vim.diagnostic.config(diag)

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            local lsp_features = require("lsp.lsp_features")

            lsp_features.autocompletion(args, client)
            lsp_features.format_on_save(args, client)
            -- lsp_features.highlight_words(args, client)
            -- lsp_features.inlay_hints(args, client)
            -- lsp_features.tab_completion()
        end,
    })
end

local use_built_in_capabilities = false
function lsp_init.set_lsp_capabilities(capabilities)
    if capabilities == nil then
        capabilities = {}
    end

    if use_built_in_capabilities then
        capabilities = vim.tbl_deep_extend("force", capabilities, vim.lsp.protocol.make_client_capabilities())
    end

    capabilities = vim.tbl_deep_extend("force", capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

    return capabilities
end

return lsp_init
