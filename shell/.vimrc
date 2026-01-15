"{{{ options/settings
"filetype plugin off " like ocaml.vim which overwrites my \ mappings
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
set completeopt=menu,menuone,noselect
set iskeyword-=-
set iskeyword-=_

"set foldmethod=marker
set modeline

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
set laststatus=2
"}}}
"{{{ keybinds
nnoremap \w :w<cr>
nnoremap \q :qa<cr>
nnoremap \x :x<cr>
nnoremap \Q :qa!<cr>
nnoremap \t :tabclose<cr>
nnoremap \y :%y+<cr>
nnoremap \p ggVG"+p
nnoremap \[ :-tabmove<cr>
nnoremap \] :+tabmove<cr>

vnoremap < <gv
vnoremap > >gv
vnoremap <C-k> :move '<-2<cr>gv=gv
vnoremap <C-j> :move '>+1<cr>gv=gv

noremap s <C-w>
"noremap S <C-w>
noremap + <C-a>
noremap - <C-x>
noremap g+ g<C-a>
noremap g- g<C-x>
noremap <C-u> <C-u>zz
noremap <C-d> <C-d>zz
" jump back to match where * was pressed
nnoremap * *N 
nnoremap gV `[V`]

let g:mapleader=" "
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 10gt
nnoremap <Leader>n :tabnew<cr>
nnoremap <Leader>` <C-6>
nnoremap <Leader>h :nohlsearch<cr>
nmap <Esc> :nohlsearch<cr>
noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P
vnoremap <C-c> "+y
vnoremap <C-v> "+p
nnoremap <Leader>V ggVG
nnoremap <Leader>= mzgg=G`z
nnoremap <Leader>[ :tabprevious<cr>
nnoremap <Leader>] :tabnext<cr>
"}}}
