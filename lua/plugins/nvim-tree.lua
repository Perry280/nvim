return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
    enabled = false,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local set = require("utils.keymap").set

            ---@param mode string | string[]
            ---@param lhs string
            ---@param rhs string | function
            ---@param desc string
            local function nvimtree_map(mode, lhs, rhs, desc)
                set(mode, lhs, rhs, { desc = "nvim-tree: " .. desc, buffer = bufnr, nowait = true })
            end

            api.config.mappings.default_on_attach(bufnr)
            nvimtree_map("n", "<C-n>", api.tree.toggle, "Toggle")
            -- nvimtree_map("n", "<C-p>", api.tree.open, "Open / Focus")

            nvimtree_map("n", "<C-h>", api.node.navigate.parent_close, "Close Directory")
            nvimtree_map("n", "<C-l>", api.tree.change_root_to_node, "CD")
            nvimtree_map("n", "h", api.node.navigate.parent, "Parent Directory")
            nvimtree_map("n", "l", api.node.open.edit, "Open")
            nvimtree_map("n", "<C-j>", api.node.navigate.sibling.next, "Next Sibling")
            nvimtree_map("n", "<C-k>", api.node.navigate.sibling.prev, "Previous Sibling")
        end,
        disable_netrw = true,
        select_prompts = true,
        sort = { sorter = "case_sensitive", },
        view = {
            width = {
                max = require("utils.window").width(1 / 4),
            },
        },
        renderer = {
            add_trailing = true,
            hidden_display = "simple",
            highlight_git = "icon",
            highlight_diagnostics = "icon",
            highlight_modified = "icon",
            indent_markers = { enable = true, },
            icons = { git_placement = "right_align", }
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        modified = { enable = true, },
    },
    keys = {
        { "<C-n>", ":NvimTreeToggle", mode = "n", desc = "nvim-tree: Toggle",       noremap = true, silent = true, nowait = true, },
        { "<C-p>", ":NvimTreeOpen",   mode = "n", desc = "nvim-tree: Open / Focus", noremap = true, silent = true, nowait = true, },
    },
}
