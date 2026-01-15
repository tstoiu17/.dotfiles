return {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup({
            icons = {
                mappings = false,
            },
            show_help = false,
            show_keys = false,
        })
    end,
}
