syntax enable
set background=dark
set number

set expandtab
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
set laststatus=2
set smartindent

set relativenumber
set nu
set hidden
set noerrorbells
set incsearch
set scrolloff=8
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Quality of Life Stuff
command! Reload execute "source ~/.vimrc"
command! Config execute ":e $MYVIMRC"

" NERDTree Settings
nmap <C-f> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Custom Keybindings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugins with Vim-plug
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/AutoComplPop'

call plug#end()

let mapleader = " "
" Remove all trailing whitespace by presing <space>tr
nnoremap <leader>tr :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
