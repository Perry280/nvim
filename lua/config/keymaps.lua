local set = require('utils').keys.set

set('n', '<leader>P', function() vim.pack.update(nil, { offline = true }) end, { desc = 'View installed packages' })
set('n', '<leader>U', vim.pack.update, { desc = 'Update installed packages' })
set('n', '<leader>R', vim.cmd.restart, { desc = 'Restart' })

set('n', '<leader>s', '<Cmd>wa<CR>', { desc = 'Save' })
set('n', '<leader>q', '<Cmd>xa<CR>', { desc = 'Save and quit' })
set('n', '<leader>bd', '<Cmd>bd!<CR>', { desc = 'Force close buffer' })
set('n', 'ì', '<Cmd>noh<CR>', { desc = 'Turn off highlight' })
set('n', '<leader>^', '<Cmd>checkhealth<CR>', { desc = 'Open checkhealth' })

set('n', 'n', 'nzzzv', { desc = 'Next pattern searched and center' })
set('n', 'N', 'Nzzzv', { desc = 'Previous pattern searched and center' })
set('n', '<C-u>', '<C-u>zz', { desc = 'Page up and center' })
set('n', '<C-d>', '<C-d>zz', { desc = 'Page down and center' })

set('v', '<', '<gv', { desc = 'Add a level of indentation to selected lines' })
set('v', '>', '>gv', { desc = 'Remove a level of indentation from selected lines' })
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines up' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines down' })

set('n', '<M-h>', '<C-W>h', { desc = 'Jump to buffer to the left' })
set('n', '<M-j>', '<C-W>j', { desc = 'Jump to buffer below' })
set('n', '<M-k>', '<C-W>k', { desc = 'Jump to buffer above' })
set('n', '<M-l>', '<C-W>l', { desc = 'Jump to buffer to the' })

set('t', '<M-h>', '<C-\\><C-N><C-W>h', { desc = 'Jump to buffer to the left' })
set('t', '<M-j>', '<C-\\><C-N><C-W>j', { desc = 'Jump to buffer below' })
set('t', '<M-k>', '<C-\\><C-N><C-W>k', { desc = 'Jump to buffer above' })
set('t', '<M-l>', '<C-\\><C-N><C-W>l', { desc = 'Jump to buffer to the' })

set('n', '<C-Up>', '<Cmd>resize +2<CR>', { desc = 'Increase height of the current window' })
set('n', '<C-Down>', '<Cmd>resize -2<CR>', { desc = 'Decrease height of the current window' })
set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Increase width of the current window' })
set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Decrease width of the current window' })

-- set({ 'i', 'c', 't' }, '<C-S-h>', '<Del>', { desc = 'Same as <Del>' })

set({ 'i', 'c' }, '<M-h>', '<Left>', { desc = 'Same as <Left>' })
set({ 'i', 'c' }, '<M-j>', '<Down>', { desc = 'Same as <Down>' })
set({ 'i', 'c' }, '<M-k>', '<Up>', { desc = 'Same as <Up>' })
set({ 'i', 'c' }, '<M-l>', '<Right>', { desc = 'Same as <Right>' })
set({ 'i', 'c' }, '<M-w>', '<C-o>w', { desc = 'Jump to next word' })
set({ 'i', 'c' }, '<M-b>', '<C-o>b', { desc = 'Jump to previous word' })
set({ 'i', 'c' }, '<M-e>', '<End>', { desc = 'Same as <End>' })
set({ 'i', 'c' }, '<M-0>', '<C-o>0', { desc = 'Same as <Home>' })
set({ 'i', 'c' }, '<M-i>', '<C-o>_', { desc = 'Jump to start of the line' })

-- Terminal
set('t', '<ESC>', '<C-\\><C-N>', { desc = 'Switch to normal mode' })

local user = vim.uv.os_getenv("USER")
if user and user == "root" then
    set('n', '<leader>tt', '<Cmd>tabnew<CR><Cmd>terminal<CR>i', { desc = 'Open terminal in a new tab', })

    local open_term = require('utils').terminal.open_term
    set('n', '<leader>th', function() open_term('horizontal') end, { desc = 'Open terminal in a new horizontal buffer', })
    set('n', '<leader>tv', function() open_term('vertical') end, { desc = 'Open terminal in a new vertical buffer', })
    set('n', '<leader>tf', function() open_term('floating') end, { desc = 'Open terminal in a new floating window', })
end

if vim.g.loaded_netrw ~= 1 then
    set('n', '<C-n>', '<Cmd>Ex<CR>2j', { desc = 'Open netrw in current directory' })
    set('n', '<leader>N', '<Cmd>e .<CR>', { desc = 'Open netrw in root directory' })

    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'netrw',
        callback = function()
            local function bind(lhs, rhs, opts)
                local kopts = { noremap = false, remap = true, buffer = true, }
                set('n', lhs, rhs, opts and vim.tbl_deep_extend('force', opts, kopts) or kopts)
            end

            bind('n', '%', { desc = 'Create new file' })
            bind('h', '-', { desc = 'Go up a directory' })
            bind('l', '<CR>2j', { desc = 'Go down a directory or open a file in a buffer' })
        end
    })
end
