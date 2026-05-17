local function gh(plugin) return 'https://github.com/' .. plugin end
local function cb(plugin) return 'https://codeberg.org/' .. plugin end

vim.pack.add({
    -- { src = gh 'catppuccin/nvim',                             name = 'catppuccin', },
    -- { src = gh 'AlexvZyl/nordic.nvim',                        name = 'nordic', },
    -- { src = gh 'gbprod/nord.nvim',                            name = 'nord', },
    -- { src = gh 'EdenEast/nightfox.nvim',                      name = 'nightfox', },
    -- { src = gh 'rebelot/kanagawa.nvim',                       name = 'kanagawa', },
    { src = gh 'rose-pine/neovim',                            name = 'rose-pine', },
    -- { src = gh 'Everblush/nvim',                              name = 'everblush' },
    -- { src = gh 'tiagovla/tokyodark.nvim',                     name = 'tokyodark', },
    -- { src = gh 'sainnhe/everforest', },
    -- { src = gh 'thesimonho/kanagawa-paper.nvim',              name = 'kanagawa-paper', },
    -- { src = cb 'ficd/ashen.nvim',                             name = 'ashen', },
    -- { src = cb 'evergarden/nvim.git',                         name = 'evergarden' },
    -- { src = gh 'folke/tokyonight.nvim',                       name = 'tokyonight', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },
    -- { src = gh '',                                            name = '', },

    { src = gh 'nvim-treesitter/nvim-treesitter', },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', },
    { src = gh 'nvim-mini/mini.nvim',                         name = 'mini', },
    { src = gh 'folke/snacks.nvim',                           name = 'snacks', },
    { src = gh 'nvim-neo-tree/neo-tree.nvim',                 name = 'neo-tree',  version = vim.version.range('3'), },
    { src = gh 'nvim-lualine/lualine.nvim',                   name = 'lualine', },

    -- dependencies
    { src = gh 'nvim-lua/plenary.nvim',                       name = 'plenary', },
    { src = gh 'MunifTanjim/nui.nvim',                        name = 'nui' },
    { src = gh 'nvim-tree/nvim-web-devicons', },
}) -- , { load = true, })

vim.pack.add({
    { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
    { src = gh 'saghen/blink.lib', },
    { src = gh 'saghen/blink.cmp', },
    -- { src = gh 'nvim-telescope/telescope.nvim',            name = 'telescope',                 version = vim.version.range('0.2.*'), },
    -- { src = gh 'nvim-telescope/telescope-fzf-native.nvim', name = 'telescope-fzf-native', },
    -- { src = gh 'nvim-telescope/telescope-ui-select.nvim',  name = 'telescope-ui-select', },
    { src = gh 'folke/trouble.nvim',   name = 'trouble', },
}, { load = function() end, })
