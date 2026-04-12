local lsp = {}

---@alias features { autocompletion: boolean, format_on_save: boolean, highlight_words: boolean, inlay_hints: boolean, tab_completion: boolean }

---@param features? features
function lsp.setup(features)
    features = features or {}

    vim.diagnostic.config({
        float = true,
        virtual_lines = { current_line = true },
        virtual_text = false, -- { current_line = true, },
        severity_sort = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client == nil then
                vim.notify('LspAttach autocommand faile.', vim.log.levels.ERROR)
                return
            end

            local opts = { buffer = args.buf }
            local set = require('utils.keymap').set

            set('i', '<C-Space>', '<C-x><C-o>', opts)
            set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            set({ 'n', 'x' }, 'gq', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

            set('n', 'grt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
            set('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

            if features.autocompletion and client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false, })
            end
            if features.format_on_save and client:supports_method('textDocument/formatting') then
                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = args.buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, })
                    end,
                })
            end
            if features.highlight_words and client:supports_method('textDocument/documentHighlight') then
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
            if features.inlay_hints and client:supports_method('textDocument/inlayHint') then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
        end,
    })
end

---@param capabilities? lsp.ClientCapabilities
---@param use_built_in_capabilities? boolean = false
---@param use_blink_capabilities? boolean = false
---@return lsp.ClientCapabilities
function lsp.set_lsp_capabilities(capabilities, use_built_in_capabilities, use_blink_capabilities)
    ---@type lsp.ClientCapabilities
    local c = capabilities or {}

    if use_built_in_capabilities or false then
        c = vim.tbl_deep_extend("force", c, vim.lsp.protocol.make_client_capabilities())
    end

    if use_blink_capabilities or false then
        c = vim.tbl_deep_extend("force", c, require('blink.cmp').get_lsp_capabilities({}, false))
    end

    return c
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
