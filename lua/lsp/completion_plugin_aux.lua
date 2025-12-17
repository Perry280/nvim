local NAME = "completion_plugin_aux"
local use_built_in_capabilities = false

local completion_plugin_aux = {}

local function check_plugin()
    local loaded = {}
    loaded.nvim_cmp = package.loaded["cmp"] ~= nil
    loaded.blink_cmp = package.loaded["blink.cmp"] ~= nil
    return loaded
end

function completion_plugin_aux.set_capabilities(capabilities)
    if capabilities == nil then
        capabilities = {}
    end

    if use_built_in_capabilities then
        capabilities = vim.tbl_deep_extend("force", capabilities,
            vim.lsp.protocol.make_client_capabilities()
        )
    end

    local loaded = check_plugin()
    print(loaded)
    if loaded.nvim_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )
    elseif loaded.blink_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities,
            require('blink.cmp').get_lsp_capabilities({}, false)
        )
    end

    return capabilities
end

return completion_plugin_aux
