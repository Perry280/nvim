---@alias colorscheme_table { [1]: string, name: string, opts: table}

---@type colorscheme_table[]
local colorschemes = {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     opts = {
    --         -- dim_inactive_windows = true,
    --         extend_background_behind_borders = true,
    --         enable = { legacy_highlights = false, },
    --         styles = { transparency = false, },
    --         highlight_groups = {
    --             CurSearch = { fg = "base", bg = "leaf", inherit = false },
    --             Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },

    --             TelescopeBorder = { fg = "overlay", bg = "overlay" },
    --             TelescopeNormal = { fg = "subtle", bg = "overlay" },
    --             TelescopeSelection = { fg = "text", bg = "highlight_med" },
    --             TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
    --             TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

    --             TelescopeTitle = { fg = "base", bg = "love" },
    --             TelescopePromptTitle = { fg = "base", bg = "pine" },
    --             TelescopePreviewTitle = { fg = "base", bg = "iris" },

    --             TelescopePromptNormal = { fg = "text", bg = "surface" },
    --             TelescopePromptBorder = { fg = "surface", bg = "surface" },
    --         },
    --     },
    -- },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        opts = {
            -- transparent_background = true,
            -- float = {
            --     transparent = true,
            -- },
            term_colors = true,
            default_integrations = false,
            integrations = {
                blink = {
                    style = 'solid',
                },
                lualine = {
                    all = function(colors)
                        return {
                            normal = {
                                a = { bg = colors.lavender, gui = "italic" },
                                b = { fg = colors.lavender },
                            }
                        }
                    end,
                    macchiato = { normal = { a = { bg = "#abcdef" }, }, },
                },
                harpoon = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                snacks = {
                    enabled = true,
                    indent_scope_color = "",
                },
                telescope = {
                    enabled = true,
                },
                lsp_trouble = true,
                neotree = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        }
    },
    -- {
    --     "alexvzyl/nordic.nvim",
    --     name = 'nordic',
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
    --     name = 'tokyonight',
    -- },
    -- {
    --     "cocopon/iceberg.vim",
    --     name = 'iceberg',
    -- },
    -- {
    --     "shaunsingh/nord.nvim",
    --     name = 'nord',
    -- },
    -- {
    --     "darkvoid-theme/darkvoid.nvim",
    --     name = 'darkvoid',
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     name = 'kanagawa',
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
    --     name = 'vague',
    -- },
    -- {
    --     "olivercederborg/poimandres.nvim",
    --     name = 'poimandres',
    -- },
    -- {
    --     "slugbyte/lackluster.nvim",
    --     name = 'lackluster',
    -- },
}

vim.cmd.colorscheme('catppuccin-mocha')

local require_plugin = require('utils').lua.require_plugin
for _, colorscheme in ipairs(colorschemes) do
    local cs = require_plugin(colorscheme.name)
    if cs ~= nil then cs.setup(colorscheme.opts) end
end
