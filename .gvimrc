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
set wildmenu
set incsearch
set splitbelow
set splitright

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

nnoremap <C-h> ^
nnoremap <C-k> -
nnoremap <C-j> <C-m>
" nnoremap <C-l> $
nnoremap <F5> <C-l>

nnoremap Q <nop>
nnoremap x "_x
nnoremap <Leader>i :set list!<CR>
nnoremap <Space> za
nnoremap <C-c> :call CopyAll()<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>cd :lcd %:p:h<CR>
nnoremap <Leader>ff :call FormatHtml()<CR>
nnoremap <Leader>fs :call SplitTags()<CR>
nnoremap <Leader>fc :call SplitCSS()<CR>
nnoremap <Leader>pr :call PressReleaseCleanup()<CR>
nnoremap <Leader>vs :vs<CR>:bnext<CR>:vert resize 100<CR>
nnoremap <c-v> "+P
nnoremap K i<cr><esc>
nnoremap gB :silent !chrome %:p<CR>

    " Compile/run cs files
nnoremap <Leader>\c :!mcs %<CR>
nnoremap <Leader>\r :!cd %:p:h && mono<space><C-r>%<BS><BS>exe<CR>

    " Edit/save/source gvimrc
nnoremap <Leader>ev :vsplit $MYGVIMRC<CR><C-w>L
nnoremap <Leader>sv :w<CR>:so %<CR>:bdel<CR>
    " Buffer Maps
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <silent> <C-Tab> :silent! Bclose<CR>
    " resize current buffer by +/- 5 
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
nnoremap <C-S-right> :vertical resize<CR>
nnoremap <C-S-left> <c-w>l:vertical resize 40<CR><c-w>h
    " Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
    " Tag list
nnoremap tt :TlistToggle<CR>

" Insert Mode Maps
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a
inoremap jk <Esc>
inoremap <C-space> <Esc>

" Visual Mode Maps
    " Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Command Mode maps
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Command abbrevs
ca W w

" Plugin Maps and Options
" Syntastic Maps
let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": [] }
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
autocmd VimResized * :wincmd =

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

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

" Some number motion thing. Just trying it out. I think I found it on freenode's #vim. Anyway the
" github is github.com/sjl/dofiles
"
" Numbers {{{
"
" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^

onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction
" }}}

" Motion for "next object". For example, "din(" would go to the next "()" pair
" and delete its contents.
" Credit to AndrewRadev gist.github.com/1171559
 
onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>
 
function! s:NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  exe "normal! f".c."v".a:motion.c
endfunction

