" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

call plug#end()
" }}}

" Filetypes {{{
filetype indent plugin on

let g:tex_flavor='latex'

" Set word-wrapping for git commit logs
autocmd Filetype gitcommit setlocal wrap linebreak nolist
			\ formatoptions+=at textwidth=72

au BufRead,BufEnter /etc/fstab set nowrap
" }}}

" Tabs {{{
set noexpandtab
set shiftwidth=4
set tabstop=4
" }}}

" Keymappings & Commands {{{
" sudo-write
command W :execute ':silent w !sudo tee % > /dev/null' | :e!
command Wq :execute ':W' | :q

" Navigate through wrapped lines like they appear in the editor
nnoremap j gj
nnoremap k gk
" }}}

" GUI {{{
" Display filename in title bar
set title

set number relativenumber
" Set Line Number color to grey
highlight LineNr ctermfg=grey

" Highlight current line
set cursorline

syntax on
set background=dark
colorscheme gruvbox

let g:airline_theme='simple'
" Always display vim-airline
set laststatus=2
" }}}

set updatetime=2000

" vim:foldmethod=marker:foldlevel=0
