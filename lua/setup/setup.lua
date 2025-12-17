require("setup.01-options")
require("setup.02-keymaps")
require("setup.03-terminal")

if vim.loop.os_uname().sysname == "Windows_NT" then
    require("setup.04-windows")
end
