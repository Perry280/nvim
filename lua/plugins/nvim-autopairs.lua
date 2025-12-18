return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        -- ignored_next_char = "[%w%.]",
        check_ts = true,
        ts_config = { "string" }
    },
}
