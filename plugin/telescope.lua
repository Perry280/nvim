---@type pluginLazySpec
local spec = {}

spec.setup = function()
    vim.cmd.packadd('telescope')
    vim.cmd.packadd('telescope-ui-select')
    vim.cmd.packadd('telescope-fzf-native')

    local telescope = require('telescope')
    local opts = {}

    local ui, _ = pcall(telescope.load_extension, 'ui-select')
    if not ui then
        vim.notify("ERROR: telescope-ui-select could not be loaded", vim.log.levels.ERROR)
    else
        local ui_select = {
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown(), }
            }
        }
        opts = vim.tbl_deep_extend('force', opts, ui_select)
    end

    local fzf, _ = pcall(telescope.load_extension, 'fzf')
    if not fzf then
        vim.notify("ERROR: telescope-fzf-native could not be loaded", vim.log.levels.ERROR)
    end

    telescope.setup(opts)
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

require('lazyloading').lazy_load(spec)
