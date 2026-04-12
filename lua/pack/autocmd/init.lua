local autocmd_path = vim.fn.stdpath('config') .. '/lua/pack/autocmd'

local ls = 'ls '
if vim.uv.os_uname().sysname == 'WindowsNT' then ls = 'dir /b ' end
local files = io.popen(ls .. autocmd_path)

if files == nil then
    vim.notify('ERROR: Could not set autocommands.', vim.log.levels.ERROR)
    return
end

for file in files:lines() do
    local module = file:match('^(.+)%.lua')
    if module and module ~= 'init' then
        require('pack.autocmd.' .. module)
    end
end
