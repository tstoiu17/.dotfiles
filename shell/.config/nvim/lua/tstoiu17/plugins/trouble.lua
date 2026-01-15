return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            keys = {
                s = false,
            },
        })
    end,
}
