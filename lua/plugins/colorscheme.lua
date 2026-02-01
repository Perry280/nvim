return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            enable = { legacy_highlights = false, },
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
    --         swap_backgrounds = false,
    --         cursorline = {
    --             theme = "light",
    --             blend = 0.3,
    --         }
    --     }
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
    --         overrides = function(colors)
    --             local theme = colors.theme
    --             return {
    --                 Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
    --                 PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
    --                 PmenuSbar = { bg = theme.ui.bg_m1 },
    --                 PmenuThumb = { bg = theme.ui.bg_p2 },

    --                 TelescopeTitle = { fg = theme.ui.special, bold = true },
    --                 TelescopePromptNormal = { bg = theme.ui.bg_p1 },
    --                 TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
    --                 TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
    --                 TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
    --                 TelescopePreviewNormal = { bg = theme.ui.bg_dim },
    --                 TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    --             }
    --         end,
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
    --     "rockerBOO/boo-colorscheme-nvim",
    --     name = "boo",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --     "slugbyte/lackluster.nvim",
    --     lazy = false,
    --     priority = 1000,
    -- },
}
