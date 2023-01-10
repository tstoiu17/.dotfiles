require("icon-picker").setup({
    disable_legacy_commands = true
})

vim.keymap.set("n", "<leader>sie", "<cmd>IconPickerYank emoji<cr>",
    { desc = "[s]earch [i]cons: [e]moji", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sin", "<cmd>IconPickerYank nerd_font<cr>",
    { desc = "[s]earch [i]cons: [n]erd_font", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sis", "<cmd>IconPickerYank symbols<cr>",
    { desc = "[s]earch [i]cons: [s]ymbols", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sia", "<cmd>IconPickerYank<cr>",
    { desc = "[s]earch [i]cons: [a]ll", noremap = true, silent = true })

-- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>",
--     { desc = "insert emoji in insert mode", noremap = true, silent = true })
