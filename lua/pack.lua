-- vim.cmd.packadd('nvim.undotree')

local function gh(plugin) return 'https://github.com/' .. plugin end

vim.pack.add({
    { src = gh 'catppuccin/nvim',                             name = 'catppuccin', },
    { src = gh 'nvim-treesitter/nvim-treesitter', },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', },
    { src = gh 'nvim-mini/mini.nvim',                         name = 'mini', },
    { src = gh 'folke/snacks.nvim',                           name = 'snacks', },
    { src = gh 'nvim-neo-tree/neo-tree.nvim',                 name = 'neo-tree',   version = vim.version.range('3'), },
    { src = gh 'nvim-lualine/lualine.nvim',                   name = 'lualine', },

    -- dependencies
    -- { src = gh 'saghen/blink.lib', },
    { src = gh 'nvim-lua/plenary.nvim',                       name = 'plenary', },
    { src = gh 'MunifTanjim/nui.nvim',                        name = 'nui' },
    { src = gh 'nvim-tree/nvim-web-devicons', },
}) -- , { load = true, })

vim.pack.add({
    { src = gh 'ThePrimeagen/harpoon',                     version = 'harpoon2' },
    { src = gh 'saghen/blink.cmp',                         version = vim.version.range('1.*'), },
    { src = gh 'nvim-telescope/telescope.nvim',            name = 'telescope',                 version = vim.version.range('0.2.*'), },
    { src = gh 'nvim-telescope/telescope-fzf-native.nvim', name = 'telescope-fzf-native', },
    { src = gh 'nvim-telescope/telescope-ui-select.nvim',  name = 'telescope-ui-select', },
    { src = gh 'folke/trouble.nvim',                       name = 'trouble', },
}, { load = function() end, })

-- require('plugins.colorscheme')
-- require('plugins.harpoon')
-- require('plugins.lualine')
-- require('plugins.mini')
-- require('plugins.neo-tree')
-- require('plugins.nvim-treesitter')
-- require('plugins.snacks')
-- require('plugins.telescope')
-- require('plugins.trouble')
-- require('plugins.ui2')
-- require('plugins.undotree')


-- vim.pack.del({
--     'catppuccin',
--     'nvim-treesitter',
--     'telescope',
--     'mini',
--     'snacks',
--     'neo-tree',
--     'lualine',
--     'trouble',
--     'nvim-treesitter-textobjects',
--     'harpoon',
--
--     'plenary',
--     'telescope-fzf-native',
--     'telescope-ui-select',
--     'nui',
--     'nvim-web-devicons',
-- })
