local lsp = vim.lsp
local buf = vim.lsp.buf

local set = require('utils').keys.set

---@alias method vim.lsp.protocol.Method.ClientToServer | vim.lsp.protocol.Method.Registration

---@type { method: method, enabled: boolean, config: fun(client: vim.lsp.Client, bufnr: integer)}[]
local method_config = {
    {
        method = 'textDocument/codeLens',
        enabled = true,
        config = function(client, bufnr)
            local client_id = client.id
            local filter = { bufnr = bufnr, id = client_id, }
            local cl = lsp.codelens

            set('n', 'grx', function()
                if cl.is_enabled(filter) then
                    cl.enable(false, filter)
                else
                    cl.enable(true, filter)
                    cl.run({ client_id = client_id })
                end
            end, { buffer = bufnr, })
        end,
    },
    {
        method = 'textDocument/completion',
        enabled = true,
        config = function(client, bufnr)
            lsp.completion.enable(true, client.id, bufnr, { autotrigger = false, })
        end,
    },
    {
        method = 'textDocument/declaration',
        enabled = true,
        config = function(_, bufnr)
            set('n', 'grD', buf.declaration, { buf = bufnr, })
        end,
    },
    {
        method = 'textDocument/definition',
        enabled = true,
        config = function(_, bufnr)
            set('n', 'grd', buf.definition, { buf = bufnr, })
        end,
    },
    {
        method = 'textDocument/documentHighlight',
        enabled = false,
        config = function(_, bufnr)
            vim.api.nvim_create_autocmd({ "CursorHold" }, {
                buffer = bufnr,
                callback = buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                buffer = bufnr,
                callback = buf.clear_references,
            })
        end,
    },
    {
        method = 'textDocument/formatting',
        enabled = true,
        config = function(client, bufnr)
            local format = function() buf.format({ bufnr = bufnr, id = client.id, }) end
            vim.api.nvim_create_autocmd('BufWritePre', { buffer = bufnr, callback = format })
            set({ 'n', 'x' }, 'gq', format, { buf = bufnr })
        end,
    },
    {
        method = 'textDocument/inlayHint',
        enabled = false,
        config = function(_, bufnr)
            lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
    },
    {
        method = 'textDocument/selectionRange',
        enabled = false,
        config = function(_, bufnr)
            set('n', '<leader>+', function() buf.selection_range(1) end, { buf = bufnr })
            set('n', '<leader>-', function() buf.selection_range(-1) end, { buf = bufnr })
        end,
    },
}

local diag = vim.diagnostic
diag.config({
    float = {
        scope = 'cursor',
        severity_sort = true,
    },
    virtual_lines = { current_line = true },
    virtual_text = false, -- { current_line = true, },
    severity_sort = true,
    update_in_insert = false,
})

set('n', '<leader>dt', function() diag.enable(not diag.is_enabled()) end)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            vim.notify('LspAttach autocommand failed.', vim.log.levels.ERROR)
            return
        end

        local bufnr = args.buf

        set('i', '<C-Space>', '<C-x><C-o>', { buffer = bufnr })

        for _, m in ipairs(method_config) do
            if m.enabled and client:supports_method(m.method) then
                m.config(client, bufnr)
            end
        end
    end,
})
