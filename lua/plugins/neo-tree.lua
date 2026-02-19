return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    -- enabled = false,
    lazy = false,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    opts = {
        sources = {
            "filesystem",
            "buffers",
            "git_status",
            -- "document_symbols",
        },
        source_selector = {
            winbar = true,
            sources = {
                { source = "filesystem" },
                { source = "buffers" },
                { source = "git_status" },
                -- { source = "document_symbols" },
            },
        },
        window = {
            mappings = {
                ["<space>"] = "none",
                ["n"] = "toggle_node",
                ["o"] = "open",
                ["oc"] = "none",
                ["od"] = "none",
                ["og"] = "none",
                ["om"] = "none",
                ["on"] = "none",
                ["os"] = "none",
                ["ot"] = "none",
                ["O"] = "show_help",
                ["Oc"] = "order_by_created",
                ["Od"] = "order_by_diagnostics",
                ["Og"] = "order_by_git_status",
                ["Om"] = "order_by_modified",
                ["On"] = "order_by_name",
                ["Os"] = "order_by_size",
                ["Ot"] = "order_by_type",
            }
        },
        -- document_symbols = {
        --     window = {
        --         mappings = {
        --             ["<C-r>"] = "none",
        --             ["Oc"] = "none",
        --             ["Od"] = "none",
        --             ["Og"] = "none",
        --             ["Om"] = "none",
        --             ["On"] = "none",
        --             ["Os"] = "none",
        --             ["Ot"] = "none",

        --         }
        --     },

        -- }
    },
    keys = {
        { "<leader>N",  ":Neotree toggle current reveal_force_cwd<CR>", mode = "n", noremap = true, silent = true, },
        { "<leader>nt", ":Neotree toggle<CR>",                          mode = "n", noremap = true, silent = true, },
        { "<C-n>",      ":Neotree reveal<CR>",                          mode = "n", noremap = true, silent = true, },
        { "<leader>nb", ":Neotree focus buffers<CR>",                   mode = "n", noremap = true, silent = true, },
        { "<leader>ng", ":Neotree focus git_status<CR>",                mode = "n", noremap = true, silent = true, },
        -- { "<leader>ns", ":Neotree focus document_symbols<CR>",          mode = "n", noremap = true, silent = true, },
    }
}
