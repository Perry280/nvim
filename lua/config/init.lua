require("config.options")
require("config.keymaps")

if vim.uv.os_uname().sysname == "Windows_NT" then
    require("config.windows")
end

require("config.terminal.term_keymaps")
