return {
    "lewis6991/gitsigns.nvim",
    -- enabled = false,
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            local set = require("utils.keymap").set
            local function git_map(mode, lhs, rhs)
                set(mode, lhs, rhs, { buffer = bufnr, })
            end

            -- Navigation
            git_map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end)

            git_map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end)

            -- Actions
            git_map("n", "<leader>hs", gitsigns.stage_hunk)
            git_map("n", "<leader>hr", gitsigns.reset_hunk)
            git_map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
            git_map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)

            git_map("n", "<leader>hS", gitsigns.stage_buffer)
            git_map("n", "<leader>hR", gitsigns.reset_buffer)
            git_map("n", "<leader>hp", gitsigns.preview_hunk)
            git_map("n", "<leader>hi", gitsigns.preview_hunk_inline)

            git_map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)

            git_map("n", "<leader>hd", gitsigns.diffthis)

            git_map("n", "<leader>hD", function() gitsigns.diffthis("~") end)

            git_map("n", "<leader>hQ", function() gitsigns.setqflist("all") end)
            git_map("n", "<leader>hq", gitsigns.setqflist)

            -- Toggles
            git_map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
            git_map("n", "<leader>tw", gitsigns.toggle_word_diff)

            -- Text object
            git_map({ "o", "x" }, "ih", gitsigns.select_hunk)
        end
    },
}
