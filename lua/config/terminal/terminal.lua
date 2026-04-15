local terminal = {}

---@param direction 'horizontal' | 'vertical' | 'float'
---@param size? number
function terminal.open_term(direction, size)
    local w = require('utils').windows

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

return terminal
