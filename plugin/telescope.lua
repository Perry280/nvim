local require_plugin = require('utils.plugin').require_plugin

local telescope = require_plugin('telescope')
if telescope == nil then return end

local opts = nil

local ui, _ = pcall(telescope.load_extension, 'ui-select')
if ui then
    local ui_select = {
        extensions = {
            ['ui-select'] = { require('telescope.themes').get_dropdown(), }
        }
    }
    opts = vim.tbl_deep_extend('force', opts or {}, ui_select)
else
    vim.notify("ERROR: telescope-ui-select could not be loaded", vim.log.levels.ERROR)
end

telescope.setup(opts)

local fzf, _ = pcall(telescope.load_extension, 'fzf')
if not fzf then
    vim.notify("ERROR: telescope-fzf-native could not be loaded", vim.log.levels.ERROR)
end

local set = require('utils.keymap').set

set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope find files', })
set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope live grep', })
set('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Telescope buffers', })
