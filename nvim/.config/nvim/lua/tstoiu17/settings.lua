vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars:append("trail:⋅") --  eol:↵,
-- vim.opt.conceallevel = 2 -- Hide * markup for bold and italic

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true -- uses undodir, see :help undodir

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable true color
vim.opt.termguicolors = true

vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

-- Give more space for displaying messages.
-- vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
vim.opt.timeoutlen = 500 -- for folke/which-key.nvim plugin

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 79

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.winminwidth = 5

vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.markdown_fenced_languages = { 'hs=haskell', 'py=python', 'bash=sh', 'sh', 'R=r', 'sql' }

vim.cmd.colorscheme("moonfly")
