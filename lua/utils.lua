local M = {
    keys = {},
    lua = {},
    terminal = {},
    windows = {},
}

-- KEYS

---@class keymapSet
---@field modes string|string[]
---@field lhs string
---@field rhs? string|function
---@field opts? vim.keymap.set.Opts

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

---@param keymaps keymapSet[]
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
---@return integer
function M.windows.height(size)
    return compute_size(size, 'horizontal')
end

---@param size? number
---@return integer
function M.windows.width(size)
    return compute_size(size, 'vertical')
end

-- TERMINAL

---@class TermID
---@field bufnr integer
---@field winnr integer
---@field jobnr integer

---@alias direction 'horizontal' | 'vertical' | 'floating'

---@type { terminals: { vertical: TermID[], horizontal: TermID[], floating: TermID[], }, buf_dir: table<integer, direction>, }
local active_terminals = {
    terminals = {
        vertical = {},
        horizontal = {},
        floating = {},
    },
    buf_dir = {},
}

---@param size? number
---@return vim.api.keyset.win_config
local function horizontal_window_config(size)
    local height = #active_terminals.terminals.horizontal == 0 and M.windows.height(size)
        or M.windows.height(1 / (#active_terminals.terminals.horizontal + 1))

    return { split = 'below', height = height, }
end

---@param size? number
---@return vim.api.keyset.win_config
local function vertical_window_config(size)
    local width = #active_terminals.terminals.vertical == 0 and M.windows.width(size)
        or M.windows.width(1 / (#active_terminals.terminals.vertical + 1))

    return { split = 'right', width = width, }
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

---@param direction direction
---@param size? number
function M.terminal.open_term(direction, size)
    local win_config = nil
    if direction == 'horizontal' then
        win_config = horizontal_window_config(size)
    elseif direction == 'vertical' then
        win_config = vertical_window_config(size)
    elseif direction == 'floating' then
        if #active_terminals.terminals.floating > 0 then
            vim.notify('ERROR: A floating terminal is already open.', vim.log.levels.ERROR)
        end
        win_config = floating_window_config(size)
    else
        error('ERROR: Invalid direction.', vim.log.levels.ERROR)
    end

    local bufnr = vim.api.nvim_create_buf(false, false)
    if bufnr == 0 then
        error('ERROR: could not create terminal buffer', vim.log.level.ERROR)
    end

    win_config.win = vim.api.nvim_get_current_win()
    local winnr = vim.api.nvim_open_win(bufnr, true, win_config)
    if winnr == 0 then
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
        error('ERROR: could not open terminal windows', vim.log.level.ERROR)
    end
    vim.api.nvim_set_current_buf(bufnr)

    local jobnr = vim.fn.jobstart(vim.o.shell, { term = true, })
    if jobnr == 0 or jobnr == -1 then
        vim.api.nvim_win_close(winnr, true)
        vim.api.nvim_buf_delete(bufnr, { force = true, unload = false })
        if jobnr == 0 then
            error('Error: could not open terminal: jobstart() arguments are invalid', vim.log.level.ERROR)
        elseif jobnr == -1 then
            error(
                'Error: could not open terminal: jobstart() argument {cmd} cannot be executed',
                vim.log.level.ERROR
            )
        end
    end
    -- print('bufnr: ' .. bufnr .. '\nwinnr: ' .. winnr .. '\njobnr: ' .. jobnr)
    -- vim.cmd.terminal()
    vim.cmd.startinsert()

    ---@type TermID
    local term_id = {
        bufnr = bufnr,
        winnr = winnr,
        jobnr = jobnr,
    }

    table.insert(active_terminals.terminals[direction], term_id)
end

vim.api.nvim_create_autocmd('TermClose', {
    callback = function(args)
        -- vim.print(vim.v.event)
        -- vim.print(args.buf)
        local bufnr = args.buf
        local term_dir = active_terminals.buf_dir[bufnr]
        if term_dir == nil then return false end

        local tlist = active_terminals.terminals[term_dir] --[[@as TermID[] --]]

        for i, term in ipairs(tlist) do
            if term.bufnr == bufnr then
                table.remove(term, i)
                return false
            end
        end

        error('Error in closing terminal.', vim.log.levels.WARN)
    end
})

return M
