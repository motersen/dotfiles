call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype indent plugin on

" Navigate through wrapped lines like they appear in the editor
nnoremap j gj
nnoremap k gk

set noexpandtab
set pastetoggle=<F2>
set shiftwidth=4
set tabstop=4
set updatetime=2000

" sudo-write
command W :execute ':silent w !sudo tee % > /dev/null' | :e!
command Wq :execute ':W' | :q

au BufRead,BufEnter /etc/fstab set nowrap

" Set word-wrapping for git commit logs
autocmd Filetype gitcommit setlocal wrap linebreak nolist
			\ formatoptions+=at textwidth=72

let g:tex_flavor='latex'


" Display filename in title bar
set title
set number relativenumber
" Set Line Number color to grey
highlight LineNr ctermfg=grey
syntax on
set background=dark
colorscheme gruvbox

let g:airline_theme='simple'
" Always display vim-airline
set laststatus=2
