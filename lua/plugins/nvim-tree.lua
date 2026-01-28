return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            -- Make nvim-tree open even when "nvim file.ext"
            vim.keymap.set("n", "<C-n>", api.tree.toggle, opts("Toggle"))
            vim.keymap.set("n", "<C-n>", api.tree.toggle, { noremap = true, silent = true, nowait = true, })
        end,
        disable_netrw = true,
        select_prompts = true,
        sort = { sorter = "case_sensitive", },
        view = {
            width = {
                max = function()
                    local max_size = 1 / 4
                    return math.floor(vim.o.columns * max_size)
                end,
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
}
