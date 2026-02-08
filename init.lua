require("setup.setup")
require("lsp.lsp_init").setup()

require("config.lazy")
vim.cmd.colorscheme("rose-pine-main")


vim.lsp.enable({
    -- "basedpyright",
    -- "bashls",
    -- "clangd",
    "lua_ls",
    -- "pyright",
})
