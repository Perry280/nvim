return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

        if vim.uv.os_uname().sysname == "Windows_NT" then
            vim.g.undotree_DiffCommand = "fc.exe"
        end
    end
}
