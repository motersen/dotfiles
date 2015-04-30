call plug#begin('~/.nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype indent plugin on

set number relativenumber

" Set Line Number color to grey
highlight LineNr ctermfg=grey

" Navigate through wrapped lines like they appear in the editor
nnoremap j gj
nnoremap k gk

set noexpandtab
set pastetoggle=<F2>
set shiftwidth=4
set tabstop=4
set updatetime=2000

" Project-specific settings
augroup Projects
	au BufRead,BufEnter /etc/fstab set nowrap
augroup END

" Set word-wrapping for git commit logs
autocmd Filetype gitcommit setlocal wrap linebreak nolist
			\ formatoptions+=at textwidth=72

let g:tex_flavor='latex'

" turn syntax highlighting on and
" show the file name in the terminal title bar
syn on se title

set background=dark
colorscheme gruvbox

" Enable powerline-fonts for vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='simple'
" Always display vim-airline
set laststatus=2
