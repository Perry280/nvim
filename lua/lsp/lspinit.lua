vim.diagnostic.config({
    float = true,
    virtual_lines = { current_line = true },
    virtual_text = false, -- { current_line = true },
    update_in_insert = true,
    severity_sort = true,
})

-- local function keymaps(opts)
--     vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)
--     vim.keymap.set("i", "<C-S>", function() vim.lsp.buf.signature_help() end, opts)
-- end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local lsp_features = require("lsp.lsp_features")

        lsp_features.autocompletion(args, client)
        lsp_features.format_on_save(args, client)
        -- lsp_features.highlight_words(args, client)
        -- lsp_features.inlay_hints(args, client)
        -- lsp_features.tab_completion()

        -- local opts = { buffer = args.buf };
        -- keymaps(opts)
    end,
})

vim.lsp.enable({
    -- "basedpyright",
    -- "bashls",
    -- "clangd",
    "lua_ls",
    -- "pyright",
})
