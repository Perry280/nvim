return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        --     local file_paths = {}
        --     for _, item in ipairs(harpoon_files.items) do
        --         table.insert(file_paths, item.value)
        --     end

        --     require("telescope.pickers").new({}, {
        --         prompt_title = "Harpoon",
        --         finder = require("telescope.finders").new_table({
        --             results = file_paths,
        --         }),
        --         previewer = conf.file_previewer({}),
        --         sorter = conf.generic_sorter({}),
        --     }):find()
        -- end

        local harpoon_list = harpoon:list()

        -- Add files to Harpoon
        vim.keymap.set("n", "<leader>a", function() harpoon_list:add() end)

        -- Toggle Harpoon menu
        -- vim.keymap.set("n", "<leader>o", function() toggle_telescope(harpoon_list) end)
        vim.keymap.set("n", "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon_list) end)

        -- Navigate between files with Ctrl-h/j/k/l
        vim.keymap.set("n", "<C-h>", function() harpoon_list:select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon_list:select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon_list:select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon_list:select(4) end)

        vim.keymap.set("n", "<A-n>", function() harpoon_list:next() end)
        vim.keymap.set("n", "<A-p>", function() harpoon_list:prev() end)

        require("telescope").load_extension("harpoon")
    end,
}
