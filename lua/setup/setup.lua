require("setup.options")
require("setup.keymaps")
require("setup.terminal")

if vim.uv.os_uname().sysname == "Windows_NT" then
    require("setup.windows")
end
