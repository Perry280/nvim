require('lazyloading').lazy_load({
    ft = 'lua',
    setup = function()
        vim.cmd.packadd('lazydev')
        require('lazydev').setup({
            library = {
                { path = "${3rd}/luv/library",          words = { "vim%.uv" } },

                -- { path = 'catppuccin',                  name = 'catppuccin', },
                { path = 'nordic',                      name = 'nordic', },
                -- { path = 'kanagawa',                    name = 'kanagawa', },
                { path = 'nvim-treesitter',             name = 'nvim%-treesitter', },
                { path = 'nvim-treesitter-textobjects', name = 'nvim%-treesitter%-textobjects', },
                { path = 'mini',                        name = 'mini',                          words = { 'Mini%w+' }, },
                { path = 'snacks',                      name = 'snacks',                        words = { 'Snacks' } },
                { path = 'neo-tree',                    name = 'neo%-tree', },
                { path = 'lualine',                     name = 'lualine', },

                -- { path = 'plenary',                     name = 'plenary', },
                -- { path = 'nui',                         name = 'nui' },
                -- { path = 'nvim-web-devicons',           name = 'nvim%-web%-devicons', },

                { path = 'harpoon',                     name = 'harpoon' },
                { path = 'blink.cmp',                   name = 'blink%.cmp', },
                -- { path = 'blink.lib',                   name = 'blink%.lib', },
                -- { path = 'telescope',                   name = 'telescope', },
                -- { path = 'telescope-fzf-native',        name = 'telescope%-fzf%-native', },
                -- { path = 'telescope-ui-select',         name = 'telescope%-ui%-select', },
                { path = 'lazydev',                     name = 'lazydev', },
                { path = 'trouble',                     name = 'trouble', },
            },
            enabled = function(root_dir)
                return root_dir == vim.fn.stdpath('config')
                    and not vim.uv.fs_stat(root_dir .. "/.luarc.json")
                    and not vim.uv.fs_stat(root_dir .. '/.luarc.jsonc')
            end,
        })
    end
})
