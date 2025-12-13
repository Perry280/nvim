require("setup.01-options")
require("setup.02-keymaps")

if vim.loop.os_uname().sysname == "Windows_NT" then
    require("setup.03-windows")
end

require("setup.04-terminal")