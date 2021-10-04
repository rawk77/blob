syntax enable
set background=dark
set number

set expandtab
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
set laststatus=2

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

call plug#end()
