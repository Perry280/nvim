local set = require("utils.keymap").set

set("t", "<ESC>", "<C-\\><C-N>", { desc = "Switch to normal mode" })
if vim.uv.os_uname().sysname == "Windows_NT" then
    set("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>", { desc = "Close terminal buffer" })
end

local term = require("setup.terminal.terminal_manager")

set("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i", { desc = "Open terminal in a new tab", })
set("n", "<leader>th", function() term.open_term("horizontal") end, { desc = "Open terminal in a new horizontal buffer", })
set("n", "<leader>tv", function() term.open_term("vertical") end, { desc = "Open terminal in a new vertical buffer", })
set("n", "<leader>tf", function() term.open_term("float") end, { desc = "Open terminal in a new floating window", })
