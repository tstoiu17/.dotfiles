return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        vim.o.foldcolumn = '0'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.o.fillchars = [[eob: ,fold: ,foldopen:-,foldsep: ,foldclose:+]]

        require('ufo').setup({
            open_fold_hl_timeout = 0,
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end,
        })

        -- Using ufo provider need remap `zR` and `zM`.
        vim.keymap.set('n', '<C-h>', 'zc')
        vim.keymap.set('n', '<C-j>', 'zj')
        vim.keymap.set('n', '<C-k>', 'zk')
        vim.keymap.set('n', '<C-l>', 'zo')
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end,
}
