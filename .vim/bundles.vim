set nocp
filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle self-management
Bundle 'gmarik/vundle'

" github Bundles

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-unimpaired'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'dahu/SearchParty'
Bundle 'SirVer/ultisnips'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kshenoy/vim-signature'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'gregsexton/MatchTag'
Bundle 'skammer/vim-css-color'

" Best Colorscheme
Bundle 'tomasr/molokai'

" vim script Bundles
Bundle 'django.vim'

filetype plugin indent on
