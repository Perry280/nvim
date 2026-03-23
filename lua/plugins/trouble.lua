return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "Trouble",
    opts = {
        focus = true,
        win = {
            type = "split",
            size = 1 / 4,
        },
    },
    keys = {
        { "<leader>tD", ":Trouble diagnostics toggle<CR>",                desc = "Diagnostics (Trouble)",                        noremap = true, silent = true, },
        { "<leader>td", ":Trouble diagnostics toggle filter.buf=0<CR>",   desc = "Buffer Diagnostics (Trouble)",                 noremap = true, silent = true, },
        { "<leader>ts", ":Trouble symbols toggle win.position=right<CR>", desc = "Symbols (Trouble)",                            noremap = true, silent = true, },
        { "<leader>tl", ":Trouble lsp toggle win.position=right<CR>",     desc = "LSP Definitions / references / ... (Trouble)", noremap = true, silent = true, },
        { "<leader>tL", ":Trouble loclist toggle<CR>",                    desc = "Location List (Trouble)",                      noremap = true, silent = true, },
        { "<leader>tQ", ":Trouble qflist toggle<CR>",                     desc = "Quickfix List (Trouble)",                      noremap = true, silent = true, },
    },
}
