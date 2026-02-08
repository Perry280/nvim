return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    init = function()
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = false,
            severity_sort = true,
        })
    end,
    opts = {
        preset = "powerline",
    }
}
