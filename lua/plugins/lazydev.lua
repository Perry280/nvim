return {
    "folke/lazydev.nvim",
    ft = "lua",
    enabled = false,
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
        enabled = function(root_dir)
            return (vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled) and not vim.uv.fs_stat(root_dir .. "/.luarc.json")
        end,
    },
}
