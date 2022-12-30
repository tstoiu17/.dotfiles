require('Comment').setup({
    toggler = {
        line = '<leader>cl', ---Line-comment toggle keymap
        block = '<leader>cbl', ---Block-comment toggle keymap
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = '<leader>c', ---Line-comment keymap
        block = '<leader>cb', ---Block-comment keymap
    },
    ---LHS of extra mappings
    extra = {
        above = '<leader>cO', ---Add comment on the line above
        below = '<leader>co', ---Add comment on the line below
        eol = '<leader>cA', ---Add comment at the end of line
    },
})
