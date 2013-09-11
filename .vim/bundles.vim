set nocp
filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" github Bundles
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'majutsushi/tagbar'
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

" Python
Bundle 'davidhalter/jedi-vim'

" Markdown
Bundle 'tpope/vim-markdown'

" Webdev
Bundle 'skammer/vim-css-color'
Bundle 'gregsexton/MatchTag'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'tsaleh/vim-matchit'

" Text objects
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'paradigm/TextObjectify'

Bundle 'kana/vim-textobj-user'
Bundle 'glts/vim-textobj-comment'

" The Only Colorscheme
Bundle 'tomasr/molokai'

" vim script Bundles
Bundle 'scratch.vim'

filetype plugin indent on
