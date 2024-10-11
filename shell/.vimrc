"{{{ options/settings
syntax on
colorscheme slate
set number
set relativenumber
set cursorline
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set conceallevel=0
set signcolumn=yes
set colorcolumn=80
set textwidth=79
set nowrap
set scrolloff=5
set sidescrolloff=8
set termguicolors
set updatetime=50
set timeoutlen=500
set shortmess+=cI

set foldmethod=marker

set expandtab
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set hlsearch
set incsearch
set ignorecase
set smartcase

set splitbelow
set splitright
set winminwidth=5

set noswapfile
set noerrorbells
set nobackup
set undofile
set laststatus=2
"}}}
"{{{ keybinds
nnoremap \w :w<cr>
nnoremap \q :qa<cr>
nnoremap \Q :qa!<cr>
nnoremap \t :tabclose<cr>

vnoremap < <gv
vnoremap > >gv

noremap s <C-w>
noremap + <C-a>
noremap - <C-x>
noremap g+ g<C-a>
noremap g- g<C-x>
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz

let g:mapleader=" "
nnoremap <Leader>` <C-6>
nnoremap <Leader>h :nohlsearch<cr>
nnoremap <Leader>Y :%y+<cr>
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
nnoremap <Leader>V ggVG
nnoremap <Leader>= mzgg=G`z
"}}}
