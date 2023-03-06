require("nvim-toggler").setup {
    inverses = {
        ["true"] = "false",
        ["True"] = "False",
        ["yes"] = "no",
        ["on"] = "off",
        ["left"] = "right",
        ["up"] = "down",
        ["!="] = "==",
    },
}

vim.keymap.set({ "n", "v" }, "<leader>i", require("nvim-toggler").toggle, { desc = "[I]nvert" })
