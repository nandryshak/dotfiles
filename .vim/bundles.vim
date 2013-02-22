set nocp
filetype off

set runtimepath+=~/.vim/bundle/vundle
set runtimepath+=~/.vim/bundle/syntastic/syntax_checkers/html
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" DOWNLOAD CONQUE RIGHT NOW IF YOU DON'T HAVE IT
" github Bundles

Bundle 'tomasr/molokai'
Bundle 'vim-ruby/vim-ruby'
Bundle 'dahu/SearchParty'
Bundle 'vim-scripts/taglist.vim'
Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'skammer/vim-css-color'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kshenoy/vim-signature'
Bundle 'gregsexton/MatchTag'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'

" vim script Bundles
Bundle 'L9'

filetype plugin indent on
