require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }
    }
}

-- next and prev buffer
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>")
