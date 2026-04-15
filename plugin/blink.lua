---@type pluginLazySpec
local spec = {}

spec.events = {
    'LspAttach',
    'CmdlineEnter',
}

spec.setup = function()
    vim.cmd.packadd('blink.cmp')

    local blink = require('utils').lua.require_plugin('blink.cmp')
    if blink == nil then return end

    blink.setup({
        keymap = {
            preset = 'default',
            -- ['<C-u>'] = { 'scroll_signature_up', 'fallback' },
            -- ['<C-d>'] = { 'scroll_signature_down', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer', --[['omni',]] --[['cmdline',]] }, },
        fuzzy = { implementation = 'prefer_rust_with_warning' },

        completion = {
            keyword = { range = 'full' },
            accept = { auto_brackets = { enabled = true }, },
            list = { selection = { preselect = true, auto_insert = true } },
            menu = {
                auto_show = true,
                draw = {
                    treesitter = { 'lsp', },
                    columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', gap = 1, 'kind' } },
                },
            },
            documentation = { auto_show = true },
            ghost_text = { enabled = false },
        },
        cmdline = {
            keymap = {
                ['<Tab>'] = { 'show', 'accept' },
                ['<Left>'] = false,
                ['<Right>'] = false,
            },
            completion = {
                menu = { auto_show = true },
                list = { selection = { preselect = true, auto_insert = true } },
            },
        },
        signature = { enabled = true },
    })

    vim.lsp.config('*', {
        capabilities = blink.get_lsp_capabilities({}, false),
    })
end

require('lazy').lazy_load(spec)
