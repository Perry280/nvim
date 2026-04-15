---@type pluginLazySpec
local spec = {}

spec.setup = function(keys)
    vim.cmd.packadd('telescope')
    vim.cmd.packadd('telescope-ui-select')
    vim.cmd.packadd('telescope-fzf-native')

    local utils = require('utils')

    local telescope = utils.lua.require_plugin('telescope')
    if telescope == nil then return end

    local opts = {}

    local ui, _ = pcall(telescope.load_extension, 'ui-select')
    if ui then
        local ui_select = {
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown(), }
            }
        }
        opts = vim.tbl_deep_extend('force', opts, ui_select)
    else
        vim.notify("ERROR: telescope-ui-select could not be loaded", vim.log.levels.ERROR)
    end

    telescope.setup(opts)

    local fzf, _ = pcall(telescope.load_extension, 'fzf')
    if not fzf then
        vim.notify("ERROR: telescope-fzf-native could not be loaded", vim.log.levels.ERROR)
    end

    utils.keys.set_keymaps(keys)
end

spec.keys = {
    {
        modes = 'n',
        lhs = '<leader>ff',
        rhs = '<Cmd>Telescope find_files<CR>',
        opts = { desc = 'Telescope find files', },
    },
    {
        modes = 'n',
        lhs = '<leader>fg',
        rhs = '<Cmd>Telescope live_grep<CR>',
        opts = { desc = 'Telescope live grep', },
    },
    {
        modes = 'n',
        lhs = '<leader>fb',
        rhs = '<Cmd>Telescope buffers<CR>',
        opts = { desc = 'Telescope buffers', },
    },
}

spec.cmds = {
    'Telescope',
}

require('lazy').lazy_load(spec)
