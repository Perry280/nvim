---@diagnostic disable-next-line: undefined-global
if keymap_utils then return end
local keymap_utils = {}

---@param mode string | string[]
---@param lhs string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
function keymap_utils.set(mode, lhs, rhs, opts)
    local kopts = { noremap = true, silent = true, }
    opts = vim.tbl_deep_extend("force", kopts, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

return keymap_utils
