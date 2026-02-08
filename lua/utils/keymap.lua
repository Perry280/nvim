local M = {}

local kopts = {
    noremap = true,
    silent = true,
}

function M.set(mode, lhs, rhs, opts)
    if opts == nil then
        opts = kopts
    else
        opts = vim.tbl_deep_extend("force", kopts, opts)
    end

    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
