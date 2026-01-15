return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            keywords = {
                FIX = {
                    icon = "F",
                    color = "error",
                    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                },
                TODO = { icon = "T", color = "info" },
                WARN = {
                    icon = "!",
                    color = "warning",
                    alt = { "WARNING", "XXX" },
                },
                PERF = {
                    icon = "P",
                    color = "test",
                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                },
                NOTE = { icon = "N", color = "hint", alt = { "INFO" } },
                HACK = { icon = "H", color = "warning" },
                TEST = {
                    icon = "T",
                    color = "test",
                    alt = { "TESTING", "PASSED", "FAILED" },
                },
                -- FIX: wow
                -- TODO: wow
                -- WARN: wow
                -- PERF: wow
                -- NOTE: wow
                -- HACK: wow
                -- TEST: wow
            },
        })
    end,
}
