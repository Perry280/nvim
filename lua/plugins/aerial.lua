return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    lazy = true,
    enabled = false,
    opts = {
        layout = {
            max_width = 0.3,
            width = 0.3,
        },
        close_automatic_events = { "unfocus", "switch_buffer", "unsupported", },
        lazy_load = true,
        highlight_on_hover = true,
        autojump = true,

        on_attach = function(bufnr)
            local set = require("utils.keymap").set

            set("n", "{", ":AerialPrev<CR>", { buffer = bufnr })
            set("n", "}", ":AerialNext<CR>", { buffer = bufnr })
        end
    },
    keys = {
        { "<leader>a", ":AerialToggle!<CR>", mode = "n", noremap = true, silent = true, }
    },
}
