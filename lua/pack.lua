local function gh(plugin) return 'https://github.com/' .. plugin end
local function cb(plugin) return 'https://codeberg.org/' .. plugin end

vim.pack.add({
    -- { src = cb 'evergarden/nvim.git',                         name = 'evergarden' },
    -- { src = gh 'AlexvZyl/nordic.nvim',                        name = 'nordic', },
    -- { src = gh 'EdenEast/nightfox.nvim',                      name = 'nightfox', },
    -- { src = gh 'Everblush/nvim',                              name = 'everblush' },
    -- { src = gh 'catppuccin/nvim',                             name = 'catppuccin', },
    -- { src = gh 'folke/tokyonight.nvim',                       name = 'tokyonight', },
    -- { src = gh 'gbprod/nord.nvim',                            name = 'nord', },
    -- { src = gh 'rebelot/kanagawa.nvim',                       name = 'kanagawa', },
    { src = gh 'rose-pine/neovim',                            name = 'rose-pine', },
    -- { src = gh 'sainnhe/everforest', },
    -- { src = gh 'thesimonho/kanagawa-paper.nvim',              name = 'kanagawa-paper', },
    -- { src = gh 'tiagovla/tokyodark.nvim',                     name = 'tokyodark', },
    -- { src = gh '',                                            name = '', },

    { src = gh 'folke/snacks.nvim',                           name = 'snacks', },
    { src = gh 'nvim-lualine/lualine.nvim',                   name = 'lualine', },
    { src = gh 'nvim-mini/mini.nvim',                         name = 'mini', },
    { src = gh 'nvim-treesitter/nvim-treesitter', },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', },
    { src = gh 'saghen/blink.cmp', },
    { src = gh 'saghen/blink.lib', },
})
