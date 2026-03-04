local window_utils = {}

---@type number
window_utils.default_window_size = 1 / 3

---@param size number
local function check_size(size)
    assert(size > 0, "size must be greater than 0.")
end

---@param size? number
---@return number
function window_utils.height(size)
    size = size or window_utils.default_window_size
    check_size(size)
    if size < 1 then
        return math.floor(vim.o.lines * size)
    else
        assert(size <= vim.o.lines, "size can't be greater than vim.o.lines")
        return math.floor(size)
    end
end

---@param size? number
---@return number
function window_utils.width(size)
    size = size or window_utils.default_window_size
    check_size(size)
    if size < 1 then
        return math.floor(vim.o.columns * size)
    else
        assert(size <= vim.o.columns, "size can't be greater than vim.o.columns")
        return math.floor(size)
    end
end

return window_utils
