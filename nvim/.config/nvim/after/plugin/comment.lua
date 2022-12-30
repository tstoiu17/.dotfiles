require('Comment').setup({
    toggler = {
        line = 'gcl', ---Line-comment toggle keymap
        block = 'gcbl', ---Block-comment toggle keymap
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = 'gc', ---Line-comment keymap
        block = 'gcb', ---Block-comment keymap
    },
    ---LHS of extra mappings
    extra = {
        above = 'gcO', ---Add comment on the line above
        below = 'gco', ---Add comment on the line below
        eol = 'gcA', ---Add comment at the end of line
    },
})
