return {
    "windwp/nvim-autopairs",
    -- enabled = false,
    event = "InsertEnter",
    opts = {
        -- ignored_next_char = "[%w%.]",
        check_ts = true,
        ts_config = { "string" }
    },
}
