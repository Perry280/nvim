local utils = {
    keys = {},
    lazy = {},
    lua = {},
    windows = {},
}

-- LUA

---@param name string
---@return unknown | nil
function utils.lua.require_plugin(name)
    local status, res = pcall(require, name)

    if not status then
        vim.notify('ERROR: ' .. name .. ' could not be loaded.', vim.log.levels.ERROR)
    end

    return status and res or nil
end

-- KEYS

---@alias keymap_set { modes: string|string[], lhs: string, rhs: string|function, opts: vim.keymap.set.Opts }

---@param mode string | string[]
---@param lhs string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
function utils.keys.set(mode, lhs, rhs, opts)
    local kopts = { noremap = true, silent = true, }
    vim.keymap.set(mode,
        lhs,
        rhs,
        opts and vim.tbl_deep_extend('force', kopts, opts) or kopts
    )
end

---@param keymaps keymap_set[]
function utils.keys.set_keymaps(keymaps)
    for _, km in ipairs(keymaps) do
        utils.keys.set(km.modes, km.lhs, km.rhs, km.opts)
    end
end

-- WINDOWS

---@type number
utils.windows.fallback_window_size = 1 / 3

---@param size? number
---@param direction 'horizontal' | 'vertical'
---@return integer
local function compute_size(size, direction)
    size = size or utils.windows.fallback_window_size
    assert(size > 0, 'Window size must be greater than 0.')

    local available_space = vim.o.columns
    if direction == 'horizontal' then
        available_space = vim.o.lines
    end

    if size < 1 then
        return math.floor(available_space * size)
    else
        assert(size <= available_space, 'Required window size is too large.')
        return math.floor(size)
    end
end

---@param size? number
---@return number
function utils.windows.height(size)
    return compute_size(size, 'horizontal')
end

---@param size? number
---@return number
function utils.windows.width(size)
    return compute_size(size, 'vertical')
end

return utils
