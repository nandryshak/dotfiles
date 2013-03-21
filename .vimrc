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

set wildignore=*.db,*.doc,*.docx,*.~,*.exe,*.dll,*.dat*,*.png,*.jpg,*.jpeg,*.gif,*.DAT,*.DAT*,*.psd,*.lnk,*.mp4

if has("win32")
    set shell=cmd.exe
else
    set shell=/bin/bash
endif

set nocp
set noswapfile
set backupcopy=yes
set autowrite
set ruler
set backspace=indent,eol,start
set cindent
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
set sc

let $PAGER=''

set backupdir=~/.vim/backups

set number
syntax on
set t_Co=256
colorscheme molokai

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

" Adds a new line below current
nnoremap <cr> A<cr><esc>

" Open buffer in chrome
nnoremap gB :silent !chrome "%:p"<CR>

" Not very useful, : is too ingrained
nnoremap <Space> :

" Start Tabular.vim
" BROKENINTERM: Just detects a space
noremap <S-Space> :Tab/

" Start a vimgrep and open results window
" BROKENINTERM
nnoremap <C-space> :vim //g % \| cw<left><left><left><left><left><left><left><left><left>

" Show open buffers
nnoremap <Leader>l :ls<CR>:b<space>

" Add a semicolon to EOL
nnoremap a; A;<esc>

" Calls Tidy
" MAKEUNIVERSAL
nnoremap <leader>x :silent %!tidy --show-body-only yes --indent auto --indent-spaces 4 --doctype omit --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>
nnoremap <leader>zx :silent %!tidy --show-body-only no --indent auto --indent-spaces 4 --doctype omit --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>

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

" write and source current buffer
nnoremap <leader>ws :w <bar> so %<cr>

" Surround.vim maps
" wrap <ul> tag around visual selection
nnoremap <leader>rul :normal ysii<ul>vit><lt><lt><cr>
" wrap <li> tag on each line in visual selection
vnoremap <leader>rli :normal yss<li><cr>
" wrap div class
vnoremap <leader>rd S<lt>div class=""<left>

" Quick search and replace
nnoremap ? :%s/<c-r>///g<left><left>


" Insert Mode Maps
inoremap jk <Esc>
inoremap <C-space> <Esc>

" Visual Mode Maps
" Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" Command Mode maps
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Command abbrevs
ca W w
ca Q q
ca Wq wq
ca Wqa wqa
ca %% <c-r>=expand('%:p:h')<CR>

" Plugin Maps and Options
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
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore = '*.dat'
nnoremap <c-p> :CtrlP C:\Users\IPS_lanshack\Documents\Pages<CR>

" SuperTab Options
let g:SuperTabDefaultCompletionType = "context"

" Fugitive commands
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gb :Gbrowse<CR>

" autocmds
autocmd BufRead *.ascx set ft=html
autocmd BufRead *.ashx set ft=cs
if has("win32")
    autocmd VimEnter * :call SetDirectory()
endif
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd VimResized * :wincmd =
autocmd FileType rb set ts=2 sts=2 sw=2 expandtab
autocmd FileType rb let b:delimitMate_matchpairs = "(:),[:],{:},<:>,|:|"
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
