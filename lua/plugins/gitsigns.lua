return {
    "lewis6991/gitsigns.nvim",
    -- enabled = false,
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            local set = require("utils.keymap").set

            ---@param mode string | string[]
            ---@param lhs string
            ---@param rhs string | function
            ---@param opts? vim.keymap.set.Opts
            local function git_map(mode, lhs, rhs, opts)
                opts = vim.tbl_deep_extend("force", { buffer = bufnr, }, opts or {})
                set(mode, lhs, rhs, opts)
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
            git_map("n", "<leader>gs", gitsigns.stage_hunk)
            git_map("n", "<leader>gr", gitsigns.reset_hunk)
            git_map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
            git_map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)

            git_map("n", "<leader>gS", gitsigns.stage_buffer)
            git_map("n", "<leader>gR", gitsigns.reset_buffer)
            git_map("n", "<leader>gp", gitsigns.preview_hunk)
            git_map("n", "<leader>gi", gitsigns.preview_hunk_inline)

            git_map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end)

            git_map("n", "<leader>gd", gitsigns.diffthis)

            git_map("n", "<leader>gD", function() gitsigns.diffthis("~") end)

            git_map("n", "<leader>gQ", function() gitsigns.setqflist("all") end)
            git_map("n", "<leader>gq", gitsigns.setqflist)

            -- Toggles
            git_map("n", "<leader>gb", gitsigns.toggle_current_line_blame)
            git_map("n", "<leader>gw", gitsigns.toggle_word_diff)

            -- Text object
            git_map({ "o", "x" }, "ih", gitsigns.select_hunk)
        end
    },
}
