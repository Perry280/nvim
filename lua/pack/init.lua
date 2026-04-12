require('pack.autocmd')

local function gh(plugin) return 'https://github.com/' .. plugin end

vim.pack.add({
    { src = gh 'catppuccin/nvim',                             name = 'catppuccin', },
    { src = gh 'nvim-treesitter/nvim-treesitter', },
    { src = gh 'nvim-telescope/telescope.nvim',               version = vim.version.range('0.2.*'), },
    { src = gh 'nvim-mini/mini.nvim', },
    { src = gh 'folke/snacks.nvim', },
    { src = gh 'nvim-neo-tree/neo-tree.nvim',                 version = vim.version.range('3'), },
    { src = gh 'nvim-lualine/lualine.nvim', },
    { src = gh 'folke/trouble.nvim', },
    { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', },
    { src = gh 'saghen/blink.cmp',                            version = vim.version.range('1.*'), },
    { src = gh 'ThePrimeagen/harpoon',                        version = 'harpoon2' },

    -- dependencies
    -- { src = gh 'saghen/blink.lib', },
    { src = gh 'nvim-lua/plenary.nvim', },
    { src = gh 'nvim-telescope/telescope-fzf-native.nvim', },
    { src = gh 'nvim-telescope/telescope-ui-select.nvim', },
    { src = gh 'MunifTanjim/nui.nvim', },
    { src = gh 'nvim-tree/nvim-web-devicons', },
})

-- Lazy loading
vim.pack.add(
    {
        { src = gh 'rachartier/tiny-inline-diagnostic.nvim', name = 'tiny-inline-diagnostic' },
    },
    {
        load = function(plug_data)
            require('pack.autocmd.' .. plug_data.spec.name)
        end,
    }
)
