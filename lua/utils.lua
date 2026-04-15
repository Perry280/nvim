local M = {
    keys = {},
    lua = {},
    terminal = {},
    windows = {},
}

-- KEYS

---@alias keymap_set { modes: string|string[], lhs: string, rhs: string|function, opts: vim.keymap.set.Opts }

---@param mode string | string[]
---@param lhs string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
function M.keys.set(mode, lhs, rhs, opts)
    local kopts = { noremap = true, silent = true, }
    vim.keymap.set(mode,
        lhs,
        rhs,
        opts and vim.tbl_deep_extend('force', kopts, opts) or kopts
    )
end

---@param keymaps keymap_set[]
function M.keys.set_keymaps(keymaps)
    for _, km in ipairs(keymaps) do
        M.keys.set(km.modes, km.lhs, km.rhs, km.opts)
    end
end

-- WINDOWS

---@type number
M.windows.fallback_window_size = 1 / 3

---@param size? number
---@param direction 'horizontal' | 'vertical'
---@return integer
local function compute_size(size, direction)
    size = size or M.windows.fallback_window_size
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
function M.windows.height(size)
    return compute_size(size, 'horizontal')
end

---@param size? number
---@return number
function M.windows.width(size)
    return compute_size(size, 'vertical')
end

-- TERMINAL

---@param direction 'horizontal' | 'vertical' | 'float'
---@param size? number
function M.terminal.open_term(direction, size)
    local w = M.windows

    local window_direction = nil
    if direction == 'horizontal' then
        window_direction = { split = 'below', height = w.height(size), }
    elseif direction == 'vertical' then
        window_direction = { split = 'right', width = w.width(size), }
    elseif direction == 'float' then
        local padding = (1 - size) / 2
        window_direction = {
            border = 'single', -- 'bold', 'double', 'none', 'rounded', 'shadow', 'single', 'solid'
            relative = 'win',
            row = w.height(padding),
            col = w.width(padding),
            height = w.height(size),
            width = w.width(size),
        }
    else
        vim.notify('ERROR: Invalid direction.', vim.log.levels.ERROR)
        return
    end

    local bufnr = vim.api.nvim_create_buf(false, false)
    if bufnr == 0 then
        vim.notify('ERROR: could not create terminal buffer', vim.log.level.ERROR)
        return
    end

    local wconfig = vim.tbl_deep_extend('force', window_direction --[[@as table]], { win = vim.api.nvim_get_current_win(), })
    local winnr = vim.api.nvim_open_win(bufnr, true, wconfig)
    if winnr == 0 then
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
        vim.notify('ERROR: could not open terminal windows', vim.log.level.ERROR)
        return
    end
    vim.api.nvim_set_current_buf(bufnr)

    -- local jid = vim.fn.jobstart(vim.o.shell, { term = true, })
    -- if jid == 0 or jid == -1 then
    --     vim.api.nvim_win_close(wid, true)
    --     vim.api.nvim_buf_delete(bid, { force = true, unload = false })
    --     if jid == 0 then
    --         vim.notify('Error: could not open terminal: jobstart() arguments are invalid', vim.log.level.ERROR)
    --     elseif jid == -1 then
    --         vim.notify('Error: could not open terminal: jobstart() argument {cmd} cannot be executed',
    --             vim.log.level.ERROR)
    --     end
    -- end
    vim.cmd.terminal()
    vim.cmd.startinsert()
end

return M
