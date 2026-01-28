local _T = {}

_T.active_terminals = {}

function _T.open_term(direction)
    local size = 1 / 3
    local padding = (1 - size) / 2

    local height = math.floor(vim.o.lines * size)
    local width = math.floor(vim.o.columns * size)
    local row = math.floor(vim.o.lines * padding)
    local col = math.floor(vim.o.columns * padding)

    local window_direction = {
        horizontal = { split = "below", height = height, },
        vertical = { split = "right", width = width, },
        float = {
            border = "single", -- "bold", "double", "none", "rounded", "shadow", "single", "solid"
            relative = "win",
            row = row,
            col = col,
            height = height,
            width = width,
        },
    }

    if window_direction[direction] == nil then
        vim.notify("Error: direction not recognised", vim.log.level.ERROR)
        return
    end

    local bid = vim.api.nvim_create_buf(false, false)
    if bid == 0 then
        vim.notify("Error: could not create terminal buffer", vim.log.level.ERROR)
        return
    end

    local wconfig = vim.tbl_deep_extend("force", window_direction[direction], { win = vim.api.nvim_get_current_win(), })
    local wid = vim.api.nvim_open_win(bid, true, wconfig)
    if wid == 0 then
        vim.api.nvim_buf_delete(bid, { force = true, unload = false })
        vim.notify("Error: could not open terminal windows", vim.log.level.ERROR)
        return
    end
    vim.api.nvim_set_current_buf(bid)

    vim.cmd.terminal()
    vim.cmd.startinsert()
    -- local jid = vim.fn.jobstart(vim.o.shell, { term = true, })
    -- if jid == 0 or jid == -1 then
    --     vim.api.nvim_win_close(wid, true)
    --     vim.api.nvim_buf_delete(bid, { force = true, unload = false })
    --     if jid == 0 then
    --         vim.notify("Error: could not open terminal: jobstart() arguments are invalid", vim.log.level.ERROR)
    --     elseif jid == -1 then
    --         vim.notify("Error: could not open terminal: jobstart() argument {cmd} cannot be executed",
    --             vim.log.level.ERROR)
    --     end
    -- end
end

function _T.toggle_term()

end

local function opts(desc)
    return {
        desc = desc,
        noremap = true,
        silent = true,
    }
end

vim.keymap.set("t", "<ESC>", "<C-\\><C-N>", opts(""))
if vim.uv.os_uname().sysname == "Windows_NT" then
    vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>", opts(""))
end

vim.keymap.set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i", opts("Open terminal in a new tab"))
vim.keymap.set("n", "<leader>th", function() _T.open_term("horizontal") end, opts("Open terminal in a new horizontal buffer"))
vim.keymap.set("n", "<leader>tv", function() _T.open_term("vertical") end, opts("Open terminal in a new vertical buffer"))
vim.keymap.set("n", "<leader>tf", function() _T.open_term("float") end, opts("Open terminal in a new floating window"))

vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-W>h", opts(""))
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-W>j", opts(""))
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-W>k", opts(""))
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-W>l", opts(""))

-- vim.api.nvim_create_autocmd("WinEnter", {
--     pattern = "term://*",
--     callback = function()
--         vim.cmd.startinsert()
--     end,
-- })

-- vim.api.nvim_create_autocmd("TermOpen", {
--     callback = function()
--         vim.cmd.scrolloff = 10
--     end
-- })
