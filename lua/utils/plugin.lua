local pack_utils = {}

---@param name string
---@return unknown
function pack_utils.require_plugin(name)
    local status, res = pcall(require, name)

    if status then
        return res
    else
        vim.notify("ERROR: " .. name .. " could not be loaded.", vim.log.levels.ERROR)
        return nil
    end
end

return pack_utils
