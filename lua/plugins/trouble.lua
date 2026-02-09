return {
    "folke/trouble.nvim",
    enabled = false,
    opts = {
        win = {
            type = "split",
        }
    },
    keys = {
        { "<leader>xx", ":Trouble diagnostics toggle<CR>",                        desc = "Diagnostics (Trouble)",                        noremap = true, silent = true, },
        { "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>",           desc = "Buffer Diagnostics (Trouble)",                 noremap = true, silent = true, },
        { "<leader>cs", ":Trouble symbols toggle focus=false<CR>",                desc = "Symbols (Trouble)",                            noremap = true, silent = true, },
        { "<leader>cl", ":Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Definitions / references / ... (Trouble)", noremap = true, silent = true, },
        { "<leader>xL", ":Trouble loclist toggle<CR>",                            desc = "Location List (Trouble)",                      noremap = true, silent = true, },
        { "<leader>xQ", ":Trouble qflist toggle<CR>",                             desc = "Quickfix List (Trouble)",                      noremap = true, silent = true, },
    },
}
