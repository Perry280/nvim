return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            -- dim_inactive_windows = true,
            extend_background_behind_borders = true,
            enable = { legacy_highlights = false, },
            styles = { transparency = false, },
            highlight_groups = {
                CurSearch = { fg = "base", bg = "leaf", inherit = false },
                Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },

                TelescopeBorder = { fg = "overlay", bg = "overlay" },
                TelescopeNormal = { fg = "subtle", bg = "overlay" },
                TelescopeSelection = { fg = "text", bg = "highlight_med" },
                TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

                TelescopeTitle = { fg = "base", bg = "love" },
                TelescopePromptTitle = { fg = "base", bg = "pine" },
                TelescopePreviewTitle = { fg = "base", bg = "iris" },

                TelescopePromptNormal = { fg = "text", bg = "surface" },
                TelescopePromptBorder = { fg = "surface", bg = "surface" },
            },
        },
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         term_colors = true,
    --         auto_integrations = true,
    --         highlight = {
    --             enable = true,
    --             additional_vim_regex_highlighting = false
    --         },
    --     }
    -- },
    -- {
    --     "alexvzyl/nordic.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         bold_keywords = true,
    --         bright_border = true,
    --         reduced_blue = true,
    --         swap_backgrounds = false,
    --         cursorline = {
    --             theme = "dark",
    --             -- blend = 0.3,
    --         },
    --         leap = {
    --             -- Dims the backdrop when using leap.
    --             dim_backdrop = false,
    --         },
    --     },
    -- },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "cocopon/iceberg.vim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "shaunsingh/nord.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "darkvoid-theme/darkvoid.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         colors = {
    --             theme = {
    --                 all = {
    --                     ui = {
    --                         bg_gutter = "none"
    --                     }
    --                 }
    --             }
    --         },
    --     },
    -- },
    -- {
    --     "vague-theme/vague.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "olivercederborg/poimandres.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "slugbyte/lackluster.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
}
