local M = {
    keys = {},
    terminal = {},
    treesitter = {},
    windows = {},
}

-- KEYS

---@param mode string | string[]
---@param lhs string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
function M.keys.set(mode, lhs, rhs, opts)
    local kopts = { noremap = true, silent = true, }
    vim.keymap.set(
        mode,
        lhs,
        rhs,
        opts and vim.tbl_deep_extend('force', kopts, opts) or kopts
    )
end

-- TERMINAL

---@param size? number
---@return vim.api.keyset.win_config
local function horizontal_window_config(size)
    return { split = 'below', height = M.windows.height(size), }
end

---@param size? number
---@return vim.api.keyset.win_config
local function vertical_window_config(size)
    return { split = 'right', width = M.windows.width(size), }
end

---@param size? number
---@return vim.api.keyset.win_config
local function floating_window_config(size)
    local padding = (1 - (size or M.windows.fallback_window_size)) / 2
    return {
        border = 'single', -- 'bold', 'double', 'none', 'rounded', 'shadow', 'single', 'solid'
        relative = 'win',
        row = M.windows.height(padding),
        col = M.windows.width(padding),
        height = M.windows.height(size),
        width = M.windows.width(size),
    }
end

---@param direction 'horizontal' | 'vertical' | 'floating'
---@param size? number
function M.terminal.open_term(direction, size)
    ---@type vim.api.keyset.win_config
    local win_config = nil
    if direction == 'horizontal' then
        win_config = horizontal_window_config(size)
    elseif direction == 'vertical' then
        win_config = vertical_window_config(size)
    elseif direction == 'floating' then
        win_config = floating_window_config(size)
    else
        error('ERROR: Invalid direction.')
    end

    local bufnr = vim.api.nvim_create_buf(false, false)
    if bufnr == 0 then
        error('ERROR: could not create terminal buffer')
    end

    win_config.win = vim.api.nvim_get_current_win()
    local winnr = vim.api.nvim_open_win(bufnr, true, win_config)
    if winnr == 0 then
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
        error('ERROR: could not open terminal windows')
    end
    vim.api.nvim_set_current_buf(bufnr)

    local jobnr = vim.fn.jobstart(vim.o.shell, { term = true, })
    if jobnr == 0 or jobnr == -1 then
        vim.api.nvim_win_close(winnr, true)
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
        if jobnr == 0 then
            error('Error: could not open terminal: jobstart() arguments are invalid')
        elseif jobnr == -1 then
            error('Error: could not open terminal: jobstart() argument {cmd} cannot be executed')
        end
    end
    -- print('bufnr: ' .. bufnr .. '\nwinnr: ' .. winnr .. '\njobnr: ' .. jobnr)
    -- vim.cmd.terminal()
    vim.cmd.startinsert()
end

-- TREESITTER

---@param langs string[]
---@param ft string
---@return string | nil
function M.treesitter.lang_for(langs, ft)
    local lang = vim.treesitter.language.get_lang(ft)
    return (lang and vim.list_contains(langs, lang)) and lang or nil
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
    assert(direction == 'horizontal' or direction == 'vertical', 'Invalid direction.')

    local available_space = direction == 'vertical' and vim.o.columns or vim.o.lines

    if size < 1 then
        return math.floor(available_space * size)
    else
        assert(size <= available_space, 'Required window size is too large.')
        return math.floor(size)
    end
end

---@param size? number
---@return integer
function M.windows.height(size)
    return compute_size(size, 'horizontal')
end

---@param size? number
---@return integer
function M.windows.width(size)
    return compute_size(size, 'vertical')
end

return M
