vim.opt.showmode = false

local function get_distro()
    local linux = ''
    local arch = '󰣇'

    local fd = vim.uv.fs_open('/etc/os-release', 'r', tonumber('644', 8))
    if not fd then return linux end

    local data = vim.uv.fs_read(fd, vim.uv.fs_fstat(fd).size, 0)
    vim.uv.fs_close(fd)

    return (data and ('\n' .. data):match('\nID="?([^"\n]+)"?') == 'arch') and arch or linux
end

require('lualine').setup({
    options = {
        theme = 'auto',
        -- globalstatus = true,
    },
    sections = {
        lualine_c = { 'filename', },
        lualine_x = { 'filetype', },
        lualine_y = { 'progress', 'location', },
        lualine_z = {
            {
                'fileformat',
                symbols = {
                    unix = get_distro(),
                }
            },
        },
    },
})
