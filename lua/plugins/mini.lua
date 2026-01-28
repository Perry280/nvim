return {
    {
        "nvim-mini/mini.surround",
        version = false,
        opts = { respect_selection_type = true, },
    },
    {
        "nvim-mini/mini.comment",
        version = false,
        opts = { options = { ignore_blank_line = true, }, },
    },
    {
        "nvim-mini/mini.cursorword",
        version = false,
        config = true,
    },
    -- {
    --     "nvim-mini/mini.indentscope",
    --     version = false,
    --     opts = {
    --     },
    --     config = function()
    --         local indentscope = require("mini.indentscope")
    --         indentscope.setup({
    --             draw = { animation = indentscope.gen_animation.none(), },
    --             options = { try_as_border = true, },
    --             symbol = '│',
    --         })
    --     end
    -- },
}
