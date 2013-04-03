" Cheat Sheet 
" How am I supposed to remember every vim command
"
" Vimdiff
" do    get changes
" dp    put changes 
" ]c    next change
" [c    prev change
"
" Spell check
" :set spell
" ]s    next error
" [s    prev error
" zg    add word
" zug   undo add word
" z=    view suggestions
silent! so ~/.vim/bundles.vim
silent! so ~/.vim/functions.vim
set wildignore=*.db,*.doc,*.docx,*.~,*.exe,*.dll,*.dat*,*.png,*.jpg,*.jpeg,*.gif,*.DAT,*.DAT*,*.psd,*.lnk,*.mp4,*.pyc,Backup\**

" Sets shell based on environment
if has("win32")
    set shell=cmd.exe
else
    set shell=/bin/bash
endif

" Can't live without these
set number
syntax on
" Sets colorscheme. Always use molokai unless you're in a terminal on Windows
" (no 256 colors on Windows term)
set t_Co=256
if has("win32") && !has("gui_running")
    colorscheme desert
else
    colorscheme molokai
endif

let mapleader = "\<space>"
set nocp               " enable vim features
set noswapfile         " no swap files
set autowrite          " autowrites on :next, etc.
set ruler              " show rows,columns in status line
set backspace=2        " make backspace actually work
set scrolloff=7        " keep the cursor 7 lines below/above the top/bottom of the window
set wildmenu           " visual responses to <tab> in the command line
set cursorline         " highlight the line the cursor is on
set ts=4 sts=4 sw=4 et " sane tab settings
set laststatus=2       " always have a status line
set sc                 " show commands in the status line as you type them
set cindent
set encoding=utf-8
set backupcopy=yes
set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright
set to tm=3000 ttm=100
set hlsearch
set history=1000

" For use with `man`
let $PAGER=''

set backupdir=~/.vim/backups

" Persistent Undo
set undofile
set undodir=~/.vim/undo
set undolevels=10000     " numbers of particular undos to save
set undoreload=100000    " number of undo lines to save

" Normal Mode Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

" Move around lines
nnoremap <C-h> ^
nnoremap <C-k> -
nnoremap <C-j> <C-m>

" Stops me from entering ex mode on accident
nnoremap Q <nop>

" Prevents character deletes from going into a register (_ is a blackhole)
nnoremap x "_x

" Show whitespace
" nnoremap <Leader>i :set list!<CR>

" Function maps
    " Pastes system clipboard
nnoremap <c-v> "+P
nnoremap <C-c> :call CopyAll()<CR>
nnoremap <Leader>ff :call FormatHtml()<CR>
nnoremap <Leader>fs :call SplitTags()<CR>
nnoremap <Leader>fc :call SplitCSS()<CR>
nnoremap <Leader>pr :call PressReleaseCleanup()<CR>

" Splits an html and css file nicely
nnoremap <Leader>vs :vs<CR>:bnext<CR><c-w><c-w>:vert resize 100<CR>

" Splits a line at cursor
nnoremap K i<cr><esc>

" Adds a new line below/above current
nnoremap <cr> o<esc>
nnoremap <s-cr> O<esc>

" Open buffer in chrome
nnoremap gB :silent !chrome "%:p"<CR>

" Start Tabular.vim
" BROKENINTERM: Just detects a space
noremap <S-Space> :Tab/

" Start a vimgrep and open results window
" BROKENINTERM
nnoremap <C-space> :vim //g % \| cw<left><left><left><left><left><left><left><left><left>

" Add a semicolon to EOL
nnoremap a; A;<esc>

" Calls Tidy
nnoremap <leader>x :silent %!tidy --show-body-only yes --indent auto --indent-spaces 4 --doctype omit --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>
nnoremap <leader>zx :silent %!tidy --show-body-only no --indent auto --indent-spaces 4 --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>

" Compile/run cs files
nnoremap <Leader>\c :!mcs %<CR>
nnoremap <Leader>\r :!cd %:p:h && mono<space><C-r>%<BS><BS>exe<CR>

" Togggle set wrap
nnoremap <Leader>w :set wrap!<CR>

" Isolate a line
nnoremap <leader><space><space> O<c-o>j<c-o>o<c-o>k<esc>

" BundleClean/Install
nnoremap <leader>bc :w <bar> so % <bar> BundleClean<CR>
nnoremap <leader>bi :w <bar> so % <bar> BundleInstall<CR>

" Edit/save/source vimrc
if has("win32")
    nnoremap <Leader>ev :vsplit ~/Documents/GitHub/dotfiles/.vimrc<CR><C-w>L
else
    nnoremap <Leader>ev :vsplit ~/dotfiles/.vimrc<CR><C-w>L
endif
nnoremap <Leader>sv :w<CR>:so %<CR>:bdel<CR>

" Buffer Maps
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <BS> <C-^>

" BROKENINTERM
nnoremap <silent> <C-Tab> :silent! Bclose<CR>

" resize current buffer by +/- 5 
" These all BROKENINTERM. A darn shame.
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
nnoremap <C-S-right> :vertical resize<CR>
nnoremap <C-S-left> <c-w>l:vertical resize 40<CR><c-w>h
nnoremap <C-S-up> :resize 30<CR>
nnoremap <C-S-down> :resize<CR>

" Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" Isolate Visual selection
vnoremap <leader><space><space> dO<cr><esc>P

" write and source current buffer
nnoremap <leader>ss :w <bar> so %<cr>

" Quick search and replace
nnoremap ? :%s/<c-r>///g<left><left>
vnoremap ? :s/<c-r>///g<left><left>

" Open Syntastic errors
nnoremap <leader>er :Errors<CR>

" Changes windows to the directory of the current buffer
nnoremap <leader>cd :lcd %:p:h<CR>:cd<CR>

" Add a class/id to the first HTML tag on the line
nnoremap <leader>ac :s/<\zs\w\+\s/&class="" /<CR>ci"
nnoremap <leader>ai :s/<\zs\w\+\s/&id="" /<CR>ci"

" Open Scratch buffer
nnoremap <leader>tmp :Scratch<CR>

" Diff THIS
nnoremap <leader>dt :difft<CR>
nnoremap <leader>ds :vert diffsplit<CR>
nnoremap <leader>do :diffo!<CR>

" Run Last :Tabularize
nnoremap <leader>lt :Tab<up><CR>

" TRACKING MAPS
" Fix tracking number csv files for work
nnoremap <leader>tq :%s/"//g<cr>
nnoremap <leader>tt :Tab/,\zs<cr>
nnoremap <leader>tn :%s/\v,\zs.*(10\d{4}).{-}(6\d{4}).{-}\ze,/\1<bar>\2/g<cr>
nnoremap <leader>ts :sor n /,/<cr>
nnoremap <leader>tp :%s/,\s\+/,/g<cr>


" Insert Mode Maps
inoremap jk <Esc>
inoremap <C-space> <c-x><c-o>
inoremap <c-c> <c-r>+
inoremap <c-f> <c-o>x

" Visual Mode Maps
vnoremap <c-c> "+y

" Command Mode maps
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <m-f> <c-right>
cnoremap <m-b> <c-left>

" Command abbrevs
ca Set set
ca W w
ca Q q
ca Wq wq
ca Wqa wqa
ca q1 q!
ca %S %s
ca Cd cd
ca E e
iab QT QuickTreX

" Plugin Maps and Options

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Enter>', '<Up>']

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" NERDCommenter options
let g:NERDUsePlaceHolders = 0
let g:NERDSpaceDelims = 1

" Ultisnips maps and options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Ctrlp Options
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '*.dat'
nnoremap <c-[> :CtrlP C:\Users\IPS_lanshack\Documents\Pages<CR>

" SuperTab Options
let g:SuperTabDefaultCompletionType = "context"

" Fugitive commands
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gb :Gbrowse<CR>

" Surround.vim maps
" wrap <ul> tag around visual selection
nnoremap <leader>rul :normal ysii<ul>vit><lt><lt><cr>
" wrap <li> tag on each line in visual selection
vnoremap <leader>rli :normal yss<li><cr>
" wrap div class
vnoremap <leader>rd S<lt>div class=""<left>

" Syntastic 
let g:syntastic_python_checkers=['pyflakes']

" autocmds
augroup fts
    au!
    autocmd BufRead,BufNewFile *.ascx set ft=html
    autocmd BufRead,BufNewFile *.aspx set ft=html
    autocmd BufRead,BufNewFile *.ashx set ft=cs
    autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd BufRead,BufNewFile *.py set nocindent
    autocmd FileType ruby set ts=2 sts=2 sw=2 expandtab
    autocmd FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:},<:>,|:|"
augroup END

if has("win32")
    autocmd VimEnter * :call SetDirectory()
endif

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
