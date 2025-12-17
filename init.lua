require("setup.setup")

require("config.lazy")
vim.cmd.colorscheme("rose-pine-main")

require("lsp.lspinit")

vim.lsp.enable({
    -- "basedpyright",
    -- "bashls",
    -- "clangd",
    "lua_ls",
    -- "pyright",
})
