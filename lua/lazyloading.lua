local M = {}

local utils_keys = require('utils').keys


---@alias pluginLazySpec { keys: keymap_set[], events: vim.api.keyset.events[], cmds: string[], setup: fun() }

---@param keys keymap_set[]
local function del_lazy_keymaps(keys)
    for _, k in ipairs(keys) do
        vim.keymap.del(k.modes, k.lhs)
    end
end

---@param ids integer[]
local function del_lazy_autocmds(ids)
    for _, id in ipairs(ids) do
        vim.api.nvim_del_autocmd(id)
    end
end

local function del_lazy_cmds(cmds)
    for _, cmd in ipairs(cmds) do
        vim.api.nvim_del_user_command(cmd)
    end
end

---@param spec pluginLazySpec
---@param autocmd_ids integer[]
local function plugin_setup(spec, autocmd_ids)
    if spec.events then del_lazy_autocmds(autocmd_ids) end
    if spec.cmds then del_lazy_cmds(spec.cmds) end
    if spec.keys then
        del_lazy_keymaps(spec.keys)
        utils_keys.set_keymaps(spec.keys)
    end

    spec.setup()
end

---@param spec pluginLazySpec
function M.lazy_load(spec)
    ---@type integer[]
    local autocmd_ids = {}

    if spec.events then
        for _, ev in ipairs(spec.events) do
            table.insert(autocmd_ids, vim.api.nvim_create_autocmd(ev, {
                once = true,
                callback = function()
                    plugin_setup(spec, autocmd_ids)
                end,
            }))
        end
    end

    if spec.cmds then
        for _, cmd in ipairs(spec.cmds) do
            vim.api.nvim_create_user_command(cmd, function(args)
                plugin_setup(spec, autocmd_ids)

                local cmd_to_run = args.args and args.name .. ' ' .. args.args or args.name
                vim.cmd(cmd_to_run)
            end, {})
        end
    end

    if spec.keys then
        for _, km in ipairs(spec.keys) do
            utils_keys.set(km.modes, km.lhs, function()
                plugin_setup(spec, autocmd_ids)

                if type(km.rhs) == 'string' then
                    local rhs = km.rhs --[[@as string]]
                    local key = vim.keycode(rhs:sub(1, 1) == ':' and "<Cmd>" .. rhs:sub(2) or rhs)
                    vim.api.nvim_feedkeys(key, 'i', false)
                else
                    km.rhs()
                end
            end)
        end
    end
end

return M
