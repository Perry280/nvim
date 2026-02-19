return {
    "mbbill/undotree",
    init = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_SplitWidth = require("utils.window").width(1 / 4)
        vim.g.undotree_SetFocusWhenToggle = 1

        if vim.uv.os_uname().sysname == "Windows_NT" then
            vim.g.undotree_DiffCommand = "fc.exe"
        end
    end,
    keys = {
        { "<leader><F5>", vim.cmd.UndotreeToggle, mode = "n", silent = true, noremap = true, }
    }
}
