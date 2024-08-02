require("tstoiu17.plugins") -- needs to required before the others
require("tstoiu17.settings")
require("tstoiu17.keymaps")

-- highlight text when it is yanked
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('tstoiu17_highlight_yank', { clear = true }),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})
