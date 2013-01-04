set nocp
filetype off

set runtimepath+=~/.vim/bundle/vundle
set runtimepath+=~/.vim/bundle/syntastic/syntax_checkers/html
set runtimepath+=~/.vim/CustomSnippets
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" github Bundles

Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'skammer/vim-css-color'
Bundle 'gregsexton/MatchTag'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tristen/vim-sparkup'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kshenoy/vim-signature'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'

" vim script Bundles
Bundle 'L9'

filetype plugin indent on
