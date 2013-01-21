set shell=cmd.exe
set nocp
set noswapfile
set backupcopy=yes
set autowrite
set ruler
set backspace=indent,eol,start
set smartindent
set laststatus=2
set encoding=utf-8
set hlsearch!
set cursorline
set ts=4 sts=4 sw=4 expandtab
set ignorecase
set smartcase
set scrolloff=7

set backupdir=~\.vim\backups

set number
syntax on
set t_Co=256
colorscheme molokai

" Persistent Undo
set undofile
set undodir=~/.vim/undo
set undolevels=1000     " numbers of particular undos to save
set undoreload=10000    " number of undo lines to save

" Normal Mode Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap Q <nop>
nnoremap <C-k> -
nnoremap <C-j> <C-m>
nnoremap <C-c> :call CopyAll()<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>cd :lcd %:p:h<CR>
nnoremap <Leader>ff :call FormatHtml()<CR>
nnoremap <Leader>fs :call SplitTags()<CR>
nnoremap <Leader>fc :call SplitCSS()<CR>
nnoremap <Leader>pr :call PressReleaseCleanup()<CR>
nnoremap <Space> za
    " Edit/save/source gvimrc
nnoremap <Leader>ev :vsplit $MYGVIMRC<CR><C-w>L
nnoremap <Leader>sv :w<CR>:so %<CR>:bdel<CR>
    " Buffer Maps
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <silent> <C-Tab> :Bclose<CR>
    " resize current buffer by +/- 5 
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
    " Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
    " Tag list
nnoremap tt :TlistToggle<CR>

" Insert Mode Maps
inoremap jk <Esc>
inoremap <C-space> <Esc>

" Visual Mode Maps
    " Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Command abbrevs
ca W w

" Plugin Maps and Options
" Syntastic Maps
nnoremap <Leader>s :SyntasticToggleMode<CR>
nnoremap <Leader>c :SyntasticCheck<CR>
nnoremap <Leader>e :Errors<CR>

" NERDTree maps and options
nnoremap <Leader>o :NERDTree<CR><CR>
let NERDTreeQuitOnOpen = 1

" NERDCommenter options
let g:NERDUsePlaceHolders = 0
let g:NERDSpaceDelims = 1

" Ultisnips maps and options
set runtimepath^=~\.vim\CustomSnippets
let g:UltiSnipsSnippetDirectories=["CustomSnippets", "Ultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Ctrlp Options
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore = '*.dat'
let g:ctrlp_open_new_file = 'r'

" autocmds
autocmd BufRead *.ashx set ft=cs
autocmd VimEnter * :call SetDirectory()
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" tpope's OpenURL function
function! OpenURL(url)
    if has("win32")
        exe "!start cmd /cstart /b ".a:url.""
    elseif $DISPLAY !~ '^\w'
        exe "silent !sensible-browser \"".a:url."\""
    else
        exe "silent !sensible-browser -T \"".a:url."\""
    endif
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser maps
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

" gvim options
set guifont=Consolas:h11:cANSI
set scroll=16
set window=33
set lines=40 columns=140
set guioptions-=lrb
set guioptions-=T
set guioptions-=r
set guioptions-=L
