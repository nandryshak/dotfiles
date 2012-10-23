set shell=/bin/bash
set nocp
filetype off



set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" github Bundles
Bundle 'skammer/vim-css-color'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'

" vim script Bundles
Bundle 'L9'
Bundle 'FuzzyFinder'

filetype plugin indent on

set number
syntax on
set t_Co=256
colorscheme molokai
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
