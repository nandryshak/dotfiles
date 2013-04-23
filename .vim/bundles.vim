set nocp
filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" github Bundles

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'dahu/SearchParty'
Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kshenoy/vim-signature'
Bundle 'Raimondi/delimitMate'

" Ruby
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'

" Python
Bundle 'davidhalter/jedi-vim'

" Web
Bundle 'skammer/vim-css-color'
Bundle 'gregsexton/MatchTag'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'tsaleh/vim-matchit'

" Text objects
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'paradigm/TextObjectify'

" The Only Colorscheme
Bundle 'tomasr/molokai'
Bundle 'nandryshak/vim-hybrid'

" vim script Bundles
Bundle 'scratch.vim'

filetype plugin indent on
