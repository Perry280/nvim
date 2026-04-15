local lsp = {}

local set = require('utils').keys.set

---@alias methods { autocompletion: boolean, format_on_save: boolean, highlight_words: boolean, inlay_hints: boolean, tab_completion: boolean }

local function diagnostic()
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
end

---@param methods? methods
function lsp.setup(methods)
    methods = methods or {
        autocompletion = true,
        format_on_save = true,
        highlight_words = true,
        inlay_hints = true,
        tab_completion = true,
    }

    diagnostic()

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client == nil then
                vim.notify('LspAttach autocommand failed.', vim.log.levels.ERROR)
                return
            end

            local opts = { buffer = args.buf }

            set('i', '<C-Space>', '<C-x><C-o>', opts)
            set('n', 'gd', vim.lsp.buf.definition, opts)
            set({ 'n', 'x' }, 'gq', function() vim.lsp.buf.format({ async = true }) end, opts)

            set('n', 'grt', vim.lsp.buf.type_definition, opts)
            set('n', 'grd', vim.lsp.buf.declaration, opts)

            if methods.autocompletion and client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false, })
            end
            if methods.format_on_save and client:supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, })
                    end,
                })
            end
            if methods.highlight_words and client:supports_method('textDocument/documentHighlight') then
                local autocmd = vim.api.nvim_create_autocmd
                local augroup = vim.api.nvim_create_autogroup("lsp_highlight", { clear = false })

                vim.api.nvim_clear_autocmds({ buffer = args.buf, group = augroup })

                autocmd({ "CursorHold" }, {
                    group = augroup,
                    buffer = args.buf,
                    callback = vim.lsp.buf.document_highlight,
                })

                autocmd({ "CursorMoved" }, {
                    group = augroup,
                    buffer = args.buf,
                    callback = vim.lsp.buf.clear_references,
                })
            end
            if methods.inlay_hints and client:supports_method('textDocument/inlayHint') then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
        end,
    })
end

-- Turn into <C-y> complete
-- function lsp_features.tab_completion()
--     vim.opt.shortmess:append("c")

--     ---@return string
--     local function tab_complete()
--         if vim.fn.pumvisible() == 1 then
--             return "<Down>"
--         end

--         local c = vim.fn.col(".") - 1
--         local is_whitespace = c == 0 or vim.fn.getline("."):sub(c, c):match("%s")

--         if is_whitespace then
--             -- insert tab
--             return "<Tab>"
--         end

--         local lsp_completion = vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"

--         if lsp_completion then
--             -- trigger lsp code completion
--             return "<C-x><C-o>"
--         end

--         -- suggest words in current buffer
--         return "<C-x><C-n>"
--     end

--     ---@return string
--     local function tab_prev()
--         if vim.fn.pumvisible() == 1 then
--             return "<Up>"
--         end

--         return "<Tab>"
--     end

--     local set = require("utils.keymap").set
--     set("i", "<Tab>", tab_complete, { desc = "Autocomplete with next suggestion", expr = true, })
--     set("i", "<S-Tab>", tab_prev, { desc = "Autocomplete with previous suggestion", expr = true, })
-- end

return lsp
