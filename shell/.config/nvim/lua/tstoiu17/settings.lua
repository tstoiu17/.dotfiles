vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_fenced_languages = { 'hs=haskell', 'py=python', 'bash=sh', 'sh', 'R=r', 'sql' }
-- vim.g.markdown_folding = 1
vim.opt.foldmethod = "marker"
vim.opt.foldenable = false
vim.cmd.colorscheme("tokyonight-night")
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.filetype.add({
    pattern = {
        ["*.tmux"] = "tmux",
    },
})

-- {{{ UI
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.list           = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.conceallevel = 0
vim.opt.signcolumn = "yes"
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 5
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 1
-- }}}
-- {{{ Tab/Indentation/Formatting
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.textwidth = 79
vim.opt.wrap = false
-- }}}
-- {{{ Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- }}}
-- {{{ idk
vim.opt.errorbells = false
vim.opt.swapfile   = false
vim.opt.backup     = false
vim.opt.undofile   = true -- uses undodir, see :help undodir
-- enable true color
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 500 -- for folke/which-key.nvim plugin
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("cI")
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- }}}
-- }}}
-- {{{ Windows
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.winminwidth = 5
-- }}}
