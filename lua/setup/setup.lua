require("setup.options")
require("setup.keymaps")

if vim.uv.os_uname().sysname == "Windows_NT" then
    require("setup.windows")
end

require("setup.terminal")
