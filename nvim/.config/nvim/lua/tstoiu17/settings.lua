vim.g.mapleader = " "
vim.g.markdown_fenced_languages = { 'hs=haskell', 'py=python', 'bash=sh', 'sh', 'R=r', 'sql' }
vim.opt.foldmethod = "marker"
vim.cmd.colorscheme("tokyonight-night")

-- {{{ UI
vim.opt.nu             = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.list           = true
vim.opt.listchars:append("trail:⋅")
vim.opt.conceallevel = 0
vim.opt.signcolumn = "yes"
-- }}}
-- {{{ Indents
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
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
vim.opt.shortmess:append("c")
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- }}}
-- {{{ Viewing experience
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 79
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 5
-- }}}
-- {{{ Windows
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.winminwidth = 5
-- }}}
