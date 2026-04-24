---@param which 'all' | 'active' | 'inactive'
---@return string[]
local function get_plugins(which)
    local pkg_iter = vim.iter(vim.pack.get())

    if which ~= 'all' then
        if which == 'active' then
            pkg_iter = pkg_iter:filter(function(x) return x.active end)
        else
            pkg_iter = pkg_iter:filter(function(x) return not x.active end)
        end
    end

    return pkg_iter:map(function(x) return x.spec.name end):totable()
end

local user_command = vim.api.nvim_create_user_command

user_command('PackDel', function(args)
    vim.pack.del(args.fargs)
end, { nargs = '+', })

user_command('PackDelAll', function()
    vim.pack.del(get_plugins('all'))
end, {})

user_command('PackDelAllInactive', function()
    local pkg_names = get_plugins('inactive')
    if #pkg_names == 0 then
        vim.notify('No inactive plugins found.', vim.log.levels.INFO)
    else
        vim.pack.del(pkg_names)
    end
end, {})

user_command('PackGet', function(args)
    vim.print(vim.pack.get(args.fargs))
end, {})

user_command('PackGetNames', function()
    local pkg_names = get_plugins('all')
    if #pkg_names == 0 then
        vim.notify('No plugins found.', vim.log.levels.INFO)
    else
        vim.print(pkg_names)
    end
end, {})

user_command('PackGetNamesInactive', function()
    local pkg_names = get_plugins('inactive')
    if #pkg_names == 0 then
        vim.notify('No inactive plugins found.', vim.log.levels.INFO)
    else
        vim.print(pkg_names)
    end
end, {})

user_command('PackGetNamesActive', function()
    local pkg_names = get_plugins('active')
    if #pkg_names == 0 then
        vim.notify('No active plugins found.', vim.log.levels.INFO)
    else
        vim.print(pkg_names)
    end
end, {})
