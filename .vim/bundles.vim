set nocp
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
" Vundle self-management
Bundle 'gmarik/vundle'
" github Bundles
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kshenoy/vim-signature'
Bundle 'mileszs/ack.vim'
" Bundle 'nandryshak/vim-extended-ft'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'junegunn/vim-easy-align'
Bundle 'godlygeek/tabular'
Bundle 'marijnh/tern_for_vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'arecarn/crunch'
Bundle 'tpope/vim-dispatch'
Bundle 'justinmk/vim-sneak'

" Markdown
Bundle 'tpope/vim-markdown'

" Webdev
Bundle 'gregsexton/MatchTag'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'chrisbra/color_highlight'

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
