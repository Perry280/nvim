return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')
            local kopts = {
                silent = true,
                noremap = true,
            }

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end, kopts)

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end, kopts)

            -- Actions
            map('n', '<leader>hs', gitsigns.stage_hunk, kopts)
            map('n', '<leader>hr', gitsigns.reset_hunk, kopts)

            map('v', '<leader>hs', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, kopts)

            map('v', '<leader>hr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, kopts)

            map('n', '<leader>hS', gitsigns.stage_buffer, kopts)
            map('n', '<leader>hR', gitsigns.reset_buffer, kopts)
            map('n', '<leader>hp', gitsigns.preview_hunk, kopts)
            map('n', '<leader>hi', gitsigns.preview_hunk_inline, kopts)

            map('n', '<leader>hb', function()
                gitsigns.blame_line({ full = true })
            end, kopts)

            map('n', '<leader>hd', gitsigns.diffthis, kopts)

            map('n', '<leader>hD', function()
                gitsigns.diffthis('~')
            end, kopts)

            map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, kopts)
            map('n', '<leader>hq', gitsigns.setqflist, kopts)

            -- Toggles
            map('n', '<leader>tb', gitsigns.toggle_current_line_blame, kopts)
            map('n', '<leader>tw', gitsigns.toggle_word_diff, kopts)

            -- Text object
            map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, kopts)
        end
    },
}
