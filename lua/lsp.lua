local lsp = vim.lsp
local buf = vim.lsp.buf
local diagnostic = vim.diagnostic

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
            end, { buf = bufnr, })
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
                buf = bufnr,
                callback = buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                buf = bufnr,
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

            local group = vim.api.nvim_create_augroup(
                ('LspFormat.%d.%d'):format(bufnr, client.id),
                { clear = true }
            )

            vim.api.nvim_create_autocmd('BufWritePre', { group = group, buf = bufnr, callback = format })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = group,
                buf = bufnr,
                callback = function(args)
                    if args.data.client_id == client.id then
                        vim.schedule(function()
                            pcall(vim.api.nvim_del_augroup_by_id, group)
                        end)
                    end
                end,
            })

            set('n', 'grf', format, { buf = bufnr, desc = 'LSP: format buffer' })
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
        enabled = false,
        config = function(client, bufnr)
            client:request(
                'textDocument/inlineValue',
                vim.lsp.util.make_text_document_params(bufnr),
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
            local show_monikers = function()
                local win = vim.api.nvim_get_current_win()
                client:request(
                    'textDocument/moniker',
                    vim.lsp.util.make_position_params(win, client.offset_encoding),
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
                    bufnr
                )
            end

            vim.api.nvim_create_user_command('LspMoniker', show_monikers, {})

            set('n', '<leader>lm', show_monikers, { buf = bufnr, desc = 'LSP: Show monikers', })
        end
    },
    {
        method = 'textDocument/onTypeFormatting',
        enabled = true,
        config = function(client, _)
            vim.lsp.on_type_formatting.enable(true, { client_id = client.id })
        end,
    },
}

diagnostic.config({
    signs = {
        text = _G.is_terminal_emulator and {
            [diagnostic.severity.ERROR] = '󰅚',
            [diagnostic.severity.WARN]  = '󰀪',
            [diagnostic.severity.INFO]  = '󰋽',
            [diagnostic.severity.HINT]  = '󰌶',
        } or nil,
        numhl = {
            [diagnostic.severity.ERROR] = 'DiagnosticError',
            [diagnostic.severity.WARN]  = 'DiagnosticWarn',
            [diagnostic.severity.INFO]  = 'DiagnosticInfo',
            [diagnostic.severity.HINT]  = 'DiagnosticHint',
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

local virtual_lines_enabled = true

set('n', '<leader>dt', function()
    if not diagnostic.is_enabled() then return end
    virtual_lines_enabled = not virtual_lines_enabled
    diagnostic.config({
        virtual_lines = (virtual_lines_enabled and { current_line = true }),
        -- virtual_text = (not virtual_lines_enabled and { current_line = true }),
    })
end, { desc = 'Toggle diagnostics virtual texts', })

set('n', '<leader>dT',
    function() diagnostic.enable(not diagnostic.is_enabled()) end,
    { desc = 'Toggle diagnostics', }
)

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            error('LspAttach autocommand failed.')
        end

        local bufnr = args.buf

        if _G.user_is_root then
            set('i', '<C-Space>', '<C-x><C-o>', { buf = bufnr, })
        end

        for _, m in ipairs(method_config) do
            -- vim.notify(
            --     m.method .. " " .. client.name ..
            --     "\nEnabled: " .. tostring(m.enabled) ..
            --     "\nSupport: " .. tostring(client:supports_method(m.method))
            -- )
            if m.enabled and client:supports_method(m.method) then
                m.config(client, bufnr)
            end
        end
    end,
})
