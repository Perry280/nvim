require("setup.setup")
require("lsp.lsp_init").setup({
    autocompletion = true,
    format_on_save = true,
})

require("config.lazy")
vim.cmd.colorscheme("catppuccin-mocha")

require("lsp.lsp_init").enable()
