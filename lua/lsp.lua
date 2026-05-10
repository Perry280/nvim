local lsp = vim.lsp
local buf = vim.lsp.buf

local set = require('utils').keys.set

---@alias LspMethod vim.lsp.protocol.Method.ClientToServer | vim.lsp.protocol.Method.Registration
---@alias LspRequest vim.lsp.protocol.Method.ClientToServer.Request

---@class LspMethodConfig
---@field method LspMethod
---@field enabled boolean
---@field config fun(client: vim.lsp.Client, bufnr: integer)

---@type LspMethodConfig[]
local method_config = {
    {
        method = 'textDocument/codeLens',
        enabled = true,
        config = function(client, bufnr)
            local client_id = client.id
            local filter = { bufnr = bufnr, id = client_id, }
            local cl = lsp.codelens

            set('n', 'grx', function()
                local cl_enabled = cl.is_enabled(filter)
                cl.enable(not cl_enabled, filter)
                if not cl_enabled then
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
        method = 'textDocument/foldingRange',
        enabled = false,
        config = function(_, _)
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end,

    },
    {
        method = 'textDocument/formatting',
        enabled = true,
        config = function(client, bufnr)
            local format = function()
                buf.format({
                    bufnr = bufnr,
                    id = client.id,
                    formatting_options = {
                        tabSize = 4,
                        insertSpaces = true,
                        trimTrailingWhitespace = true,
                        insertFinalNewline = false,
                        trimFinalNewlines = true,
                    },
                })
            end
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
        method = 'textDocument/inlineValue',
        enabled = true,
        config = function(client, bufnr)
            client:request(
                'textDocument/inlineValue',
                vim.lsp.utils.make_text_document_params(bufnr),
                function(err)
                    if err then error(tostring(err)) end
                end,
                bufnr
            )
        end
    },
    {
        method = 'textDocument/linkedEditingRange',
        enabled = false,
        config = function(client, _)
            vim.lsp.linked_editing_range.enable(true, { client_id = client.id })
        end,
    },
    {
        method = 'textDocument/moniker',
        enabled = true,
        config = function(client, bufnr)
            ---@param b integer
            ---@param c vim.lsp.Client
            local function show_monikers(b, c)
                local win = vim.api.nvim_get_current_win()
                c:request(
                    'textDocument/moniker',
                    vim.lsp.util.make_position_params(win, c.offset_encoding),
                    function(err, result)
                        if err then
                            vim.notify('LSP moniker error: ' .. vim.inspect(err), vim.log.levels.ERROR)
                            return
                        end
                        if not result or #result == 0 then
                            vim.notify('No monikers for symbol under cursor', vim.log.levels.WARN)
                            return
                        end

                        -- Format each moniker for display
                        local lines = {}
                        for _, m in ipairs(result) do
                            local kind = m.kind or 'unknown'
                            local unique = m.unique or '?'
                            table.insert(lines, string.format(
                                '[%s] %s  (kind: %s, unique: %s)',
                                m.scheme, m.identifier, kind, unique
                            ))
                        end

                        vim.notify(table.concat(lines, '\n'), vim.log.levels.INFO)
                    end,
                    b
                )
            end

            vim.api.nvim_create_user_command('LspMoniker',
                function() show_monikers(bufnr, client) end,
                {}
            )

            vim.keymap.set('n', '<leader>lm',
                function() show_monikers(bufnr, client) end,
                { bufnr = bufnr, desc = 'LSP: Show monikers' }
            )
        end
    },
    {
        method = 'textDocument/onTypeFormatting',
        enabled = true,
        config = function(client, _)
            vim.lsp.on_type_formatting.enable(true, { client_id = client.id })
        end,
    },
    {
        method = 'textDocument/semanticTokens',
        enabled = true,
        config = function(client, _)
            vim.lsp.semantic_tokens.enable(true, { client_id = client.id })
        end,
    },
}

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚',
            [vim.diagnostic.severity.WARN]  = '󰀪',
            [vim.diagnostic.severity.INFO]  = '󰋽',
            [vim.diagnostic.severity.HINT]  = '󰌶',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN]  = 'DiagnosticWarn',
            [vim.diagnostic.severity.INFO]  = 'DiagnosticInfo',
            [vim.diagnostic.severity.HINT]  = 'DiagnosticHint',
        },
    },
    float = {
        scope = 'cursor',
        severity_sort = true,
    },
    virtual_lines = { current_line = true },
    virtual_text = false, -- { current_line = true },
    severity_sort = true,
    update_in_insert = false,
})

---@param bufnr integer
local function toggle_diagnostics(bufnr)
    local virtual_lines_enabled = true

    set('n', '<leader>dt', function()
        if not vim.diagnostic.is_enabled() then return end
        virtual_lines_enabled = not virtual_lines_enabled
        vim.diagnostic.config({ virtual_lines = (virtual_lines_enabled and { current_line = true }) })
    end, { desc = 'Toggle diagnostics virtual texts', buf = bufnr, })

    set('n', '<leader>dT',
        function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
        { desc = 'Toggle diagnostics', buf = bufnr, }
    )
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            error('LspAttach autocommand failed.', vim.log.levels.ERROR)
        end

        local bufnr = args.buf

        toggle_diagnostics(bufnr)
        set('i', '<C-Space>', '<C-x><C-o>', { buf = bufnr, })

        for _, m in ipairs(method_config) do
            if m.enabled and client:supports_method(m.method) then
                m.config(client, bufnr)
            end
        end
    end,
})
