require('pack.autocmd')

vim.cmd.packadd('nvim.undotree')

local function gh(plugin) return 'https://github.com/' .. plugin end

vim.pack.add({
    { src = gh 'catppuccin/nvim',                             name = 'catppuccin', },
    { src = gh 'nvim-treesitter/nvim-treesitter', },
    { src = gh 'nvim-telescope/telescope.nvim',               name = 'telescope',                 version = vim.version.range('0.2.*'), },
    { src = gh 'nvim-mini/mini.nvim',                         name = 'mini', },
    { src = gh 'folke/snacks.nvim',                           name = 'snacks', },
    { src = gh 'nvim-neo-tree/neo-tree.nvim',                 name = 'neo-tree',                  version = vim.version.range('3'), },
    { src = gh 'nvim-lualine/lualine.nvim',                   name = 'lualine', },
    { src = gh 'folke/trouble.nvim',                          name = 'trouble', },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', },
    { src = gh 'saghen/blink.cmp',                            version = vim.version.range('1.*'), },
    { src = gh 'ThePrimeagen/harpoon',                        version = 'harpoon2' },
    { src = gh 'rachartier/tiny-inline-diagnostic.nvim',      name = 'tiny-inline-diagnostic' },

    -- dependencies
    -- { src = gh 'saghen/blink.lib', },
    { src = gh 'nvim-lua/plenary.nvim',                       name = 'plenary', },
    { src = gh 'nvim-telescope/telescope-fzf-native.nvim',    name = 'telescope-fzf-native', },
    { src = gh 'nvim-telescope/telescope-ui-select.nvim',     name = 'telescope-ui-select', },
    { src = gh 'MunifTanjim/nui.nvim',                        name = 'nui' },
    { src = gh 'nvim-tree/nvim-web-devicons', },
})

-- Lazy loading
-- vim.pack.add(
--     {
--     },
--     {
--         load = function(plug_data)
--             require('pack.autocmd.' .. plug_data.spec.name)
--         end,
--     }
-- )
