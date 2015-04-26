"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
" Required:
  set runtimepath+=$HOME/.nvim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand("$HOME/.nvim/bundle"))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'altercation/vim-colors-solarized'

" Required:
call neobundle#end()

" Required:
" Set indent before plugin to avoid indentation problems
filetype indent plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

execute pathogen#infect()

set number relativenumber

" Set Line Number color to grey
highlight LineNr ctermfg=grey

nnoremap , :
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

syntax enable
set background=dark
colorscheme gruvbox

" Enable powerline-fonts for vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='simple'
" Always display vim-airline
set laststatus=2
