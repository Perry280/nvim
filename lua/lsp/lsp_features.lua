---@diagnostic disable-next-line: undefined-global
if lsp_features then return end

local lsp_features = {}

---@param args vim.api.keyset.create_autocmd.callback_args
---@param method string
---@return vim.lsp.Client | nil
local function supports_method(args, method)
    if args == nil then return nil end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return nil end

    return (client:supports_method(method) or nil) and client
end

---@param args vim.api.keyset.create_autocmd.callback_args
function lsp_features.autocompletion(args)
    local client = supports_method(args, "textDocument/completion")
    if client == nil then return end

    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    vim.cmd("set completeopt+=menuone,noselect") -- fuzzy
end

---@param args vim.api.keyset.create_autocmd.callback_args
function lsp_features.format_on_save(args)
    local client = supports_method(args, "textDocument/formatting")
    if client == nil then return end

    vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
            vim.lsp.buf.format({
                bufnr = args.buf,
                id = client.id,
            })
        end,
    })
end

---@param args vim.api.keyset.create_autocmd.callback_args
function lsp_features.inlay_hints(args)
    local client = supports_method(args, "textDocument/inlayHint")
    if client == nil then return end

    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
end

---@param args vim.api.keyset.create_autocmd.callback_args
function lsp_features.highlight_words(args)
    local client = supports_method(args, "textDocument/documentHighlight")
    if client == nil then return end

    local autocmd = vim.api.nvim_create_autocmd
    local augroup = autocmd("lsp_highlight", { clear = false })

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

function lsp_features.tab_completion()
    vim.opt.shortmess:append("c")

    local function tab_complete()
        if vim.fn.pumvisible() == 1 then
            return "<Down>"
        end

        local c = vim.fn.col(".") - 1
        local is_whitespace = c == 0 or vim.fn.getline("."):sub(c, c):match("%s")

        if is_whitespace then
            -- insert tab
            return "<Tab>"
        end

        local lsp_completion = vim.bo.omnifunc == "v:lua.vim.lsp.omnifunc"

        if lsp_completion then
            -- trigger lsp code completion
            return "<C-x><C-o>"
        end

        -- suggest words in current buffer
        return "<C-x><C-n>"
    end

    local function tab_prev()
        if vim.fn.pumvisible() == 1 then
            return "<Up>"
        end

        return "<Tab>"
    end

    local set = require("utils.keymap").set
    set("i", "<Tab>", tab_complete, { desc = "Autocomplete with next suggestion", expr = true, })
    set("i", "<S-Tab>", tab_prev, { desc = "Autocomplete with previous suggestion", expr = true, })
end

return lsp_features
