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
    set shell=/bin/zsh
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
set linebreak
set textwidth=0
set nostartofline
set backupdir=~/.vim/backups

" For use with `man`
let $PAGER=''

" Persistent Undo
set undofile
set undodir=~/.vim/undo
set undolevels=10000     " numbers of particular undos to save
set undoreload=100000    " number of undo lines to save

" Normal Mode Maps

" Window movement
nnoremap <up> <c-w>k
nnoremap <down> <c-w>j
nnoremap <right> <c-w>l
nnoremap <left> <c-w>h
nnoremap <c-right> <c-w>w

" Move around lines better sometimes
nnoremap <C-h> ^
nnoremap <C-k> -
nnoremap <C-j> <C-m>

" Stops me from entering ex mode on accident. I don't use it anyway.
nnoremap Q <nop>

" Prevents character deletes from going into a register (_ is a blackhole)
nnoremap x "_x

" Pastes system clipboard. Use <c-q> to enter visual block mode. You may have
" to change terminal settings for it to work.
nnoremap <c-v> "+P

" Adds a new line below/above current
nnoremap <cr> o<esc>
nnoremap <s-cr> O<esc>

" Open buffer in chrome
nnoremap gB :silent !chrome "%:p"<CR>

" Start Tabular.vim
" FIXME. Just detects a space in terminal
noremap <S-Space> :Tab/

" Start a vimgrep and open results window
" FIXME in terminal
nnoremap <C-space> :vim //g ** \| cw<home><right><right><right><right><right>
nnoremap <C-S-space> :vim //g % \| cw<home><right><right><right><right><right>

" Add a semicolon, period, etc. to EOL. I should probably make this into a
" function so it's compatible with any key but I'm lazy.
nnoremap a; m`A;<esc>``
nnoremap a: m`A:<esc>``
nnoremap a. m`A.<esc>``
nnoremap a, m`A,<esc>``
nnoremap a> m`A><esc>``
nnoremap a! m`A!<esc>``
nnoremap a? m`A?<esc>``
nnoremap a0 m`A)<esc>``
nnoremap a] m`A]<esc>``
nnoremap a} m`A}<esc>``

" Calls Tidy
nnoremap <leader>x :silent %!tidy --show-body-only yes --indent auto --indent-spaces 4 --doctype omit --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>
nnoremap <leader>zx :silent %!tidy --show-body-only no --indent auto --indent-spaces 4 --numeric-entities no --break-before-br yes --output-html yes --wrap 0 --show-errors 0 -q -i<CR><CR>

" Togggle set wrap
nnoremap <Leader>w :set wrap!<CR>

" BundleClean/Install
nnoremap <leader>bc :w <bar> so % <bar> BundleClean<CR>
nnoremap <leader>bi :w <bar> so % <bar> BundleInstall<CR>

" Edit/save/source vimrc
if has("win32")
    nnoremap <Leader>ev :vsplit ~/Documents/GitHub/dotfiles/.vimrc<CR><C-w>L
else
    nnoremap <Leader>ev :vsplit ~/dotfiles/.vimrc<CR><C-w>L
endif
nnoremap <Leader>sv :w <bar> so %<CR>:bdel<CR>

" Buffer Maps
nnoremap <Tab> :bn<CR>
nnoremap <BS> :bp<CR>

" FIXME in terminal
nnoremap <silent> <C-Tab> :silent! Bclose<CR>

" FIXME in terminal
nnoremap <silent> <c-s-tab> :silent! Bdel!<CR>

" resize current buffer by +/- 5
" FIXME These all broken in terminal. A darn shame.
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

" Copen
nnoremap <leader>co :copen<cr>

" Changes windows to the directory of the current buffer
nnoremap <leader>cd :lcd %:p:h<CR>:cd<CR>

" Add a class/id to the first HTML tag on the line
nnoremap <leader>ac :silent! s/<\zs\w\+/& class=""/<CR>ci"
nnoremap <leader>ai :silent! s/<\zs\w\+/& id=""/<CR>ci"
nnoremap <leader>aa :silent! s/\vimg.{-}\zs\ze\>/ alt=""/g<CR>ci"

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

nnoremap <leader>ti :call CleanUp()<cr>
nnoremap <leader>tc :s/\v^.{-},\zs.{-}\ze,//g<cr>
nnoremap <leader>td :%s/\v((10\d{4}).*)\n.*(\2)/\1/<cr>

nnoremap <leader>ts :sor n /,/<cr>
nnoremap <leader>tp :%s/,\s\+/,/g<cr>
" END TRACKING MAPS

" Beautifiers
nnoremap <leader>jx :call JsBeautify()<cr>
nnoremap <leader>hx :call HtmlBeautify()<cr>
nnoremap <leader>cx :call CSSBeautify()<cr>

" Copy buffer to system clipboard
nnoremap <c-c> :%y +<cr>

" split line
nnoremap K i<cr><esc>

" update buffer
nnoremap <c-s> :up<cr>

" Edit ultisnips
nnoremap <leader>ue :e ~/.vim/bundle/ultisnips/UltiSnips/

" Align C comments
nnoremap <leader>a/ :Tab/^[^\/]*\zs\//l1l0<cr>

" make and run
nnoremap <leader>ma :update<cr>:make %:r\|copen<cr><c-w>w:!%:r

" Spell check
nnoremap \s ea<C-X><C-S>

" Sum first numbers
nnoremap <leader>sf :%s/\d\+/\=Sum(submatch(0))/g<cr>:echo g:S<cr>

" Sum regex numbers
nnoremap <leader>sr :%s//\=Sum(submatch(0))/g\|echo g:S<home><right><right><right>

" Replace stupid quotes and TM and R signs
nnoremap <leader>qr :%s/[“”]/"/ge\|%s/[‘’]/'/ge\|%s/®/\&reg;/ge\|%s/™/\&trade;/ge\|%s/\s\+&\s\+/ \&amp; /ge<cr>

" Do Maths
nnoremap <leader>dm :DoMaths<cr>
nnoremap <leader>d= :DoMathsVerbose<cr>

" Run ctags
nnoremap <leader>ct :silent !ctags -R<cr>

" Isolate line
nnoremap <leader><space><space> ddO<cr><esc>P

""" Insert Mode Maps
" vars
inoremap <c-x>= =<space>;<left>

" More undo points
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

" Add semi-colon to EOL
" inoremap <c-l> <esc>m`A;<esc>``a
inoremap <c-l> <C-o>m`<C-o>A;<C-o>``

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

" split a line at cursor
inoremap <c-k> <cr>

" next line
inoremap <c-j> <esc>o

" Tag completion
inoremap </ </<C-X><C-O>

" HTML tag completion
inoremap <silent> <C-X><space> <esc>ciW<lt><c-r>"></<c-r>"><esc>F<i
inoremap <silent> <C-X><cr> <esc>ciW<lt><c-r>"><cr></<c-r>"><esc>O<tab>

" Do maths
inoremap <c-e> <esc>:DoMathsVerbose<cr>A

""" Visual Mode Maps
" Copy visual selection to system clipboard. Use v, V, or <c-q> to exit visual
" mode without copying.
vnoremap <c-c> "+y

" Command Mode maps
" Heresy.
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
ca Qa qa
ca Wq wq
ca Wqa wqa
ca Read read
ca R r
ca q1 q!
ca %S %s
ca Cd cd
ca E e

" Commands
" SoftWrap text after using hard wrap.
command! -range=% SoftWrap
            \ <line2>put _ |
            \ <line1>,<line2>g/^/ .;-/^$/ join |normal $x |
            \ g/^/norm o |
            \ %s/\s\+$//

" does maths
command! DoMaths
            \ exec '.g/\./s/^/scale=2; /' | exec '.!bc' | norm <c-l>
" Shows answer for maths
command! DoMathsVerbose
            \ .y |
            \ exec '.g/\./s/^/scale=2; /' |
            \ exec '.!bc' |
            \ exec 'norm <c-l>I<c-r>0 = <esc>kJ$vB"+y0'

" Plugin Maps and Options
" extended-ft
let g:ExtendedFT_caseOption = '\C'

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
let g:ctrlp_mruf_excluse = '*.csv'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = '*.dat'
let g:ctrlp_extensions = ['tag', 'line']

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
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_mode_map = { 'mode': 'passive' }

" autocmds
augroup PROSE
    autocmd BufRead,BufNewFile *.md set ft=markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=74
    autocmd BufRead,BufNewFile *.md set formatoptions=t1
augroup END
augroup bufenters
    au!
    autocmd BufEnter * syntax sync fromstart
augroup fts
    au!
    autocmd BufRead,BufNewFile *.config set ft=xml
    autocmd BufRead,BufNewFile *.master set ft=html
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

hi TrailingWhitespace ctermbg=red guibg=red
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinLeave,InsertEnter * hi TrailingWhitespace NONE
    au WinEnter,InsertLeave * set cursorline
    au WinEnter,InsertLeave * hi TrailingWhitespace ctermbg=red guibg=red
    " au BufWritePre * :silent! %s/\s\+$//e | norm ``
augroup END

" Highlight trailing whitespace
match TrailingWhitespace /\S\zs\s\+$/

function! DelTrailWhitesp()
    redir => l:gOutput
    silent! g/\S\zs\s\+$/
    redir END
    let g:FuncOutput = strpart(l:gOutput, 1, 7)
    if (g:FuncOutput != "Pattern")
        silent! exec 'silent! %s/\s\+$//e'
        exe "norm \<c-o>"
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
