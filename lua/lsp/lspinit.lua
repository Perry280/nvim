vim.diagnostic.config({
    virtual_text = { current_line = true },
    float = true,
    update_in_insert = true,
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
    "lua_ls",
    -- "clangd",
    -- "pyright",
    -- "bashls",
})
