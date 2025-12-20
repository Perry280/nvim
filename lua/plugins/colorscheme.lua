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
        -- config = function()
        --     vim.opt.laststatus = 3
        --     vim.opt.statusline = " %f %m %= %l:%c ♥ "
        --     require("rose-pine").setup({
        --         highlight_groups = {
        --             StatusLine = { fg = "love", bg = "love", blend = 10 },
        --             StatusLineNC = { fg = "subtle", bg = "surface" },
        --         },
        --     })
        -- end
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
    --     config = function()
    --         require("tokyonight").setup({
    --             on_highlights = function(hl, c)
    --                 local prompt = "#2d3149"
    --                 hl.TelescopeNormal = {
    --                     bg = c.bg_dark,
    --                     fg = c.fg_dark,
    --                 }
    --                 hl.TelescopeBorder = {
    --                     bg = c.bg_dark,
    --                     fg = c.bg_dark,
    --                 }
    --                 hl.TelescopePromptNormal = {
    --                     bg = prompt,
    --                 }
    --                 hl.TelescopePromptBorder = {
    --                     bg = prompt,
    --                     fg = prompt,
    --                 }
    --                 hl.TelescopePromptTitle = {
    --                     bg = prompt,
    --                     fg = prompt,
    --                 }
    --                 hl.TelescopePreviewTitle = {
    --                     bg = c.bg_dark,
    --                     fg = c.bg_dark,
    --                 }
    --                 hl.TelescopeResultsTitle = {
    --                     bg = c.bg_dark,
    --                     fg = c.bg_dark,
    --                 }
    --             end,
    --         })
    --     end
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
    --         colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
    --         overrides = function(colors)
    --             local theme = colors.theme

    --             local makeDiagnosticColor = function(color)
    --                 local c = require("kanagawa.lib.color")
    --                 return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
    --             end

    --             return {
    --                 TelescopeTitle             = { fg = theme.ui.special, bold = true },
    --                 TelescopePromptNormal      = { bg = theme.ui.bg_p1 },
    --                 TelescopePromptBorder      = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
    --                 TelescopeResultsNormal     = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
    --                 TelescopeResultsBorder     = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
    --                 TelescopePreviewNormal     = { bg = theme.ui.bg_dim },
    --                 TelescopePreviewBorder     = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

    --                 Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
    --                 PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
    --                 PmenuSbar                  = { bg = theme.ui.bg_m1 },
    --                 PmenuThumb                 = { bg = theme.ui.bg_p2 },

    --                 DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
    --                 DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
    --                 DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
    --                 DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
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
}
