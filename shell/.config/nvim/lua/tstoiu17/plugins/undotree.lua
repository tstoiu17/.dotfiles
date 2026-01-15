return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle)
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.opt.undofile                  = true
    end,
}
