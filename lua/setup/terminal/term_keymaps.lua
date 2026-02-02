local map = require("utils.utils").map

map("t", "<ESC>", "<C-\\><C-N>")
if vim.uv.os_uname().sysname == "Windows_NT" then
    map("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>")
end

local term = require("setup.terminal.terminal")

map("n", "<leader>tt", ":tabnew<CR>:terminal<CR>i", { desc = "Open terminal in a new tab", })
map("n", "<leader>th", function() term.open_term("horizontal") end, { desc = "Open terminal in a new horizontal buffer", })
map("n", "<leader>tv", function() term.open_term("vertical") end, { desc = "Open terminal in a new vertical buffer", })
map("n", "<leader>tf", function() term.open_term("float") end, { desc = "Open terminal in a new floating window", })
