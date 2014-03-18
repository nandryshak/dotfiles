" Cheat Sheet
"
" Ack.vim
" :Ack [options] {pattern} [{directories}]
" :Ack, :AckAdd, :LAck, :LAckAdd
" o    to open (same as enter)
" O    to open and close quickfix window
" go   to preview file (open but maintain focus on ack.vim results)
" t    to open in new tab
" T    to open in new tab silently
" h    to open in horizontal split
" H    to open in horizontal split silently
" v    to open in vertical split
" gv   to open in vertical split silently
" q    to close the quickfix window
"
" Vim-dispatch
"     :Make - background make, auto open quickfix window
"    :Make! - background make, open quickfix window with :Copen
" :Dispatch - background task, captures output
"    :Start - foreground task, doesn't capture output
"   :Start! - background task, doens't capture output
"
" EasyAlign
" 1) <enter> in visual mode or <leader>a followed by movement to start
" interactive mode
" 2) Optional: N-th delimiter (default: 1)
"   - 1 Around the 1st occurrences of delimiters
"   - 2 Around the 2nd occurrences of delimiters
"   - ...
"   - * Around all occurrences of delimiters
"   - ** Left-right alternating alignment around all delimiters
"   - - Around the last occurrences of delimiters (-1)
"   - -2 Around the second to last occurrence of delimiters
" 3) Delimiter key (a single keystroke: <space>, =, ;, ., |, &, , or <c-x>)
"   - Regex delimiter: use <c-x> to type a regular expression
" 4) Optional: Enter keys to select alignment mode (left, right, or center)
" 5) Optional: Addition alignment options
"   - <c-f>   | Filter         | Input string ([gv]/.*/?)
"   - <c-l>   | left_margin    | Input number or string
"   - <c-r>   | right_margin   | Input number or string
"   - <left>  | stick_to_left  | true or false
"   - <right> | stick_to_right | true or false
"   - <down>  | *_margin       | margin = 0
" 6) Delimiter key (a single keystroke: <space>, =, ;, ., |, &, , or <c-x>)

silent! so ~/.vim/bundles.vim
silent! so ~/.vim/functions.vim
set wildignore=*.db,*.doc,*.docx,*.~,*.exe,*.dll,*.dat*,*.png,*.jpg,*.jpeg,*.gif,*.DAT,*.DAT*,*.psd,*.lnk,*.mp4,*.pyc,Backup\**

" Sets shell based on environment
if has("win32")
    set shell=cmd.exe
else
    set shell=/bin/zsh
endif

set number
set relativenumber
syntax on
" Sets colorscheme. Always use molokai unless you're in a terminal on Windows
" (no 256 colors on Windows term)
set t_Co=256
if has("win32") && !has("gui_running")
    colorscheme desert
else
    colorscheme molokai
endif
if !has("win32")
    set t_Co=16
    silent! colorscheme desert
    silent! colorscheme ir_black
endif

"""""""""""
" OPTIONS "
"""""""""""
let mapleader = "\<space>"
set backupdir=~/.vim/backups
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
set autoindent
set encoding=utf-8
set backupcopy=yes
set ignorecase
set smartcase
set incsearch
set splitbelow
set splitright
set timeout timeoutlen=3000 ttimeoutlen=100
set hlsearch
set history=1000
set linebreak
set textwidth=0
set nostartofline " keep cursor in same column when using motions
runtime! macros/matchit.vim
highlight ColorColumn guibg=#293739
set colorcolumn=81
set synmaxcol=800

" For use with `man`
let $PAGER=''

" Persistent Undo
set undofile
set undodir=~/.vim/undo
set undolevels=10000     " numbers of particular undos to save
set undoreload=100000    " number of undo lines to save
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir))
endif

"""""""""""
" BUFFERS "
"""""""""""

" quit buffer
nnoremap Q :bd<cr>
" REALLY quit
nnoremap RQ :bd!<cr>

" next/prev buffer
nnoremap <Tab> :bn<CR>
nnoremap <BS> :bp<CR>

" Copy buffer to system clipboard
nnoremap <c-c> :%y +<cr>

" update buffer
nnoremap S :up<cr>

" Open Scratch buffer
nnoremap <leader>tmp :Scratch<CR>

" write and source current buffer
nnoremap <leader>ss :w <bar> so %<cr>

" Open buffer directory in explorer
nnoremap <leader>oe :silent !explorer.exe %:p:h<cr>

" Open buffer in chrome
nnoremap gB :silent !chrome "%:p"<CR>

" bufdo - does last command in all other buffers
function! BufDoLastCommand()
    undo
    silent! bufdo @:
endfunction
command! -nargs=0 Bufdo :call BufDoLastCommand()
" type BD to do a comment in all buffers
cabbrev BD silent! bufdo

" Edit/save/source vimrc
if has("win32")
    nnoremap <Leader>ev :vsplit ~/Documents/GitHub/dotfiles/.vimrc<CR><C-w>L
else
    nnoremap <Leader>ev :vsplit ~/dotfiles/.vimrc<CR><C-w>L
endif
nnoremap <Leader>sv :w <bar> so %<CR>:bdel<CR>

" BundleClean/Install
nnoremap <leader>bc :w <bar> so % <bar> BundleClean<CR>
nnoremap <leader>bi :w <bar> so % <bar> BundleInstall<CR>

"""""""""""
" WINDOWS "
"""""""""""

" Window movement
nnoremap <up> <c-w>k
nnoremap <down> <c-w>j
nnoremap <right> <c-w>l
nnoremap <left> <c-w>h

" resize current window by +/- 5
" FIXME These all broken in terminal. A darn shame.
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>
nnoremap <C-S-right> :vertical resize<CR>
nnoremap <C-S-left> <c-w>l:vertical resize 40<CR><c-w>h
nnoremap <C-S-up> :resize 30<CR>
nnoremap <C-S-down> :resize<CR>

""""""""""""
" MOVEMENT "
""""""""""""

" Move around lines better sometimes
nnoremap <C-h> ^
nnoremap <C-k> -
nnoremap <C-j> <C-m>

"""""""""""
" EDITING "
"""""""""""

" Pastes system clipboard. Use <c-q> to enter visual block mode. You may have
" to change terminal settings for it to work.
nnoremap <c-v> "+P

" Prevents character deletes from going into a register (_ is a blackhole)
nnoremap x "_x

" Add a semicolon EOL.
nnoremap a; m`A;<esc>``

" Bubble single lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" Bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" Adds a new line below/above current
nnoremap <cr> o<esc>
" FIXME
nnoremap <s-cr> O<esc>

" split line
nnoremap K i<cr><esc>

" Spell check
nnoremap <leader>sc ea<c-x><c-s><esc>

" Isolate line
nnoremap <leader><space><space> ddO<cr><esc>P
" Isolate Visual selection
vnoremap <leader><space><space> dO<cr><esc>P

" zip a thing over to the end of line
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

""""""""""""""
" FORMATTING "
""""""""""""""

" EasyAlign
nmap <leader>a <Plug>(LiveEasyAlign)
vmap <cr> <Plug>(LiveEasyAlign)

" Start Tabular.vim
" FIXME. Just detects a space in terminal
noremap <S-Space> :Tab/

" Calls Tidy
nnoremap <leader>x :silent %! tidy --vertical-space no --doctype omit --output-html yes --wrap 0 --show-errors 0 --show-body-only auto --indent auto --indent-spaces 4 -q -i<cr><cr>:silent! %s/<\/li>\zs\n\ze\s*\n\s*<li>//g<cr>

" Run Last :Tabularize
nnoremap <leader>lt :Tab<up><CR>

" Beautifiers
nnoremap <leader>jx :call JsBeautify()<cr>
nnoremap <leader>hx :call HtmlBeautify()<cr>
nnoremap <leader>cx :call CSSBeautify()<cr>
vnoremap <leader>jx :call JsBeautify("'<","'>")<cr>
vnoremap <leader>hx :call HtmlBeautify("'<","'>")<cr>
vnoremap <leader>cx :call CSSBeautify("'<","'>")<cr>

"""""""""""""
" SEARCHING "
"""""""""""""

" Quick search and replace
nnoremap ? :%s/<c-r>///g<left><left>
vnoremap ? :s/<c-r>///g<left><left>

" Start a vimgrep and open results window
" FIXME in terminal
nnoremap <C-space> :vim //g ** \| cw<home><right><right><right><right><right>
nnoremap <C-S-space> :cex [] \| bufdo vimgrepadd //g % \| cw<left><left><left><left><left><left><left><left><left>

" centers search
nnoremap n nzz
nnoremap N Nzz

" clear search highlights
nnoremap <c-l> :nohl<cr><c-l>

""""""""""""""""""""
" COMPILING/MAKING "
""""""""""""""""""""

" make and run
nnoremap <leader>ma :update<cr>:Make %:r<cr>
" for D
nnoremap <leader>md :up \| silent! !dmd %<cr>:copen<cr><c-w>w:!%:r

"""""""""""
" UTILITY "
"""""""""""

" Togggle set wrap
nnoremap <Leader>w :set wrap!<CR>

" Changes windows to the directory of the current buffer
nnoremap cd :lcd %:p:h<CR>:cd<CR>

" Diff THIS
nnoremap <leader>dt :difft<CR>
nnoremap <leader>ds :vert diffsplit<CR>
nnoremap <leader>do :diffo!<CR>

" TRACKING MAPS
" Fix tracking number csv files for work
nnoremap <leader>tq :%s/"//g<cr>
nnoremap <leader>tt :Tab/,\zs<cr>
nnoremap <leader>ti :call CleanUp()<cr>
nnoremap <leader>td :%s/\v((10\d{4}).*)\n.*(\2)/\1/<cr>
nnoremap <leader>ts :sor n /,/<cr>
nnoremap <leader>tp :%s/,\s\+/,/g<cr>
" END TRACKING MAPS

" Sum first numbers
nnoremap <leader>sf :silent! %s/\d\+/\=Sum(submatch(0))/g<cr>:echo g:S<cr>

" Sum regex numbers
nnoremap <leader>sr :silent! %s//\=Sum(submatch(0))/g\|echo g:S<home><right><right><right>

" Replace stupid quotes and TM and R signs
nnoremap <leader>qr :%s/[“”]/"/ge\|%s/[‘’]/'/ge\|%s/®/\&reg;/ge\|%s/™/\&trade;/ge\|%s/\s\+&\s\+/ \&amp; /ge<cr>

" Do Maths
nnoremap <leader>dm :DoMaths<cr>
nnoremap <leader>d= :DoMathsVerbose<cr>

" Run ctags
nnoremap <leader>ct :silent !ctags -R<cr>

" Copy visual selection to system clipboard. Use v, V, or <c-q> to exit visual
" mode without copying.
vnoremap <c-c> "+y

" Fix syntax
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

""""""""
" MISC "
""""""""

" Fix Y
nnoremap Y y$

" move backward a jump
nnoremap _ <c-o>

" move forward a jump
nnoremap + <c-i>

"""""""""""""""
" PLUGIN MAPS "
"""""""""""""""

" open snippets
nnoremap <leader>ne :vsp \| NeoSnippetEdit<cr>

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

""""""""""""""""""""
" INSERT MODE MAPS "
""""""""""""""""""""

" More undo points
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

" Add semi-colon to EOL
inoremap <c-l> <C-o>m`<C-o>A;<C-o>``
inoremap jj <esc>m`A;<esc>``

" Goto EOL
inoremap <c-a> <c-o>A

" The only way to exit insert mode
inoremap jk <esc>

" Omni completion
inoremap <C-space> <c-x><c-o>

" paste from system clipboard
inoremap <c-c> <c-r>+

" extra del key
inoremap <c-f> <c-o>x

" next line
inoremap <c-j> <esc>o

" HTML tag completion
inoremap <silent> <C-X><space> <esc>ciW<lt><c-r>"></<c-r>"><esc>F<i
inoremap <silent> <C-X><cr> <esc>ciW<lt><c-r>"><cr></<c-r>"><esc>O<tab>

" Do maths
inoremap <c-e> <esc>:DoMathsVerbose<cr>A

"""""""""""""""""""""
" Command Mode maps "
"""""""""""""""""""""

" Heresy.
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <m-f> <c-right>
cnoremap <m-b> <c-left>

" force write a ro file
cnoremap w!! %!sudo tee > /dev/null %

" Command abbrevs
cabbrev Set set
cabbrev W w
cabbrev Q q
cabbrev Qa qa
cabbrev Wq wq
cabbrev Wqa wqa
cabbrev Read read
cabbrev R r
cabbrev q1 q!
cabbrev %S %s
cabbrev Cd cd
cabbrev E e


""""""""""""
" Commands "
""""""""""""

" does maths
command! DoMaths
            \ exec '.g/\./s/^/scale=2; /' | exec '.!bc' | norm <c-l>
" Shows answer for maths
command! DoMathsVerbose
            \ .y |
            \ exec '.g/\./s/^/scale=2; /' |
            \ exec '.!bc' |
            \ exec 'norm <c-l>I<c-r>0 = <esc>kJ$vB"+y0'

"""""""""""""""""""""""""""
" PLUGIN MAPS AND OPTIONS "
"""""""""""""""""""""""""""

" vim-sneak
" replace 'f' with inclusive 1-char Sneak
let g:sneak#streak = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" replace 't' with exclusive 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" Colorizer
let g:colorizer_auto_filetype='css,html,javascript'

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '`':'`',  '|':'|'}

" Neocomplete
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" set minumum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" autocomplpop like behavior
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_prefetch = 1
" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ }
" Define keyowrd
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin keymappings
inoremap <silent> <cr> <c-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<cr>"
endfunction
inoremap <expr><c-h> neocomplete#smart_close_popup() . "\<c-h>"
inoremap <expr><bs> neocomplete#smart_close_popup() . "\<c-h>"
inoremap <expr><space> neocomplete#smart_close_popup()
" NeoSnippets
let neosnippet#snippets_directory = '~/.vim/bundle/neosnippet.vim/autoload/neosnippet/snippets'
" SuperTab like snippets behavior.
imap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <s-tab> <c-p>
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" Airline
let g:airline_powerline_fonts = 1
" Bufferline
let g:bufferline_echo = 0

" TextObjColumn remaps. The default's conflict with comment objects
let g:skip_default_textobj_word_column_mappings = 1
xnoremap <silent> av :<C-U>call TextObjWordBasedColumn("aw")<CR>
onoremap <silent> av :call TextObjWordBasedColumn("aw")<CR>
xnoremap <silent> iv :<C-U>call TextObjWordBasedColumn("iw")<CR>
onoremap <silent> iv :call TextObjWordBasedColumn("iw")<CR>
xnoremap <silent> aV :<C-U>call TextObjWordBasedColumn("aW")<CR>
onoremap <silent> aV :call TextObjWordBasedColumn("aW")<CR>
xnoremap <silent> iV :<C-U>call TextObjWordBasedColumn("iW")<CR>
onoremap <silent> iV :call TextObjWordBasedColumn("iW")<CR>

" CamelCase
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" NERDCommenter options
let g:NERDUsePlaceHolders = 0
let g:NERDSpaceDelims = 1

" Ctrlp Options
let g:ctrlp_mruf_excluse = '*.csv'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '*.dat'
let g:ctrlp_extensions = ['tag', 'line']

augroup fts
    autocmd BufRead,BufNewFile *.md set ft=markdown
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd Filetype html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd BufRead,BufNewFile *.config set ft=xml
    autocmd BufRead,BufNewFile *.master set ft=html
    autocmd BufRead,BufNewFile *.ascx set ft=html
    autocmd BufRead,BufNewFile *.aspx set ft=html
    autocmd BufRead,BufNewFile *.ashx set ft=cs
    autocmd BufRead,BufNewFile *.aspx syn region Comment start='<%--' end='--%>'
    autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType python exec 'nnoremap <leader>ma :up<cr>:Dispatch python2 %<cr>'
    autocmd BufRead,BufNewFile *.py set nocindent
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal makeprg=go\ build\ -o\ %:r.exe\ %
    autocmd FileType go nnoremap <leader>ma :make<cr>:Dispatch %:r<cr>
augroup END

if has("win32")
    autocmd VimEnter * :call SetDirectory()
endif

augroup Misc
    au VimResized * :wincmd =
    au BufWritePre * DelTrailWhitesp
    au InsertLeave * set nopaste
augroup END

hi TrailingWhitespace ctermbg=red guibg=red
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinLeave,InsertEnter * hi TrailingWhitespace NONE
    au WinEnter,InsertLeave * set cursorline
    au WinEnter,InsertLeave * hi TrailingWhitespace ctermbg=red guibg=red
augroup END

" Highlight trailing whitespace
match TrailingWhitespace /\S\zs\s\+$/
function! DelTrailWhitesp()
    if search('\s\+$', 'np')
        silent! %s/\s\+$//e | silent! norm ``zz
    endif
endfunction
command! -nargs=0 DelTrailWhitesp :call DelTrailWhitesp()

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
