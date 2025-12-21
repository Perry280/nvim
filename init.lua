require("setup.setup")

require("config.lazy")
vim.cmd.colorscheme("rose-pine-main")

require("lsp.lsp_init").setup()

vim.lsp.enable({
    -- "basedpyright",
    -- "bashls",
    -- "clangd",
    "lua_ls",
    -- "pyright",
})
