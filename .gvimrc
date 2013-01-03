set shell=cmd.exe
set nocp
set noswapfile

set backupcopy=yes
set autowrite
set ruler
set backspace=indent,eol,start
set number
syntax on
set t_Co=256
colorscheme molokai
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8
set hlsearch!
set cursorline
set ts=4 sts=4 sw=4 expandtab
set foldmethod=syntax

" Functions {{{1
	" FormatHtml
function FormatHtml ()
	:%s/<[^>]*>/\r&\r/g
	:g/^$/d
	:g/^\s\+$/d
	:normal gg=G
endfunction
	" CopyAll
function CopyAll()
	:exec "normal gg\"+yG\<c-o>\<c-o>"
endfunction
    " Set directory
function SetDirectory()
    if filereadable(glob('~\atWork.txt'))
        :cd O:\Pages
    elseif filereadable('~\atHome.txt')
        :cd C:\Users\Nick\Desktop
    elseif filereadable('~/vps.txt')
        :cd ~
    else
        :cd
    endif
endfunction
" }}}1
	
" Normal Mode Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <C-c> :call CopyAll()<CR>
nnoremap <Leader>f :call FormatHtml()<CR>
    " Buffer Maps
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <C-Tab> :bdelete<CR>
    " Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Insert Mode Maps
inoremap <S-Space> <Esc>

" Visual Mode Maps
    " Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Syntastic Maps
nnoremap <Leader>s :SyntasticToggleMode<CR>
nnoremap <Leader>c :SyntasticCheck<CR>
nnoremap <Leader>e :Errors<CR>

" NERDTree maps
nnoremap <Leader>o :NERDTree<CR><CR>
let NERDTreeQuitOnOpen = 1

" Ultisnips maps
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" autocmds
autocmd VimEnter * :call SetDirectory()

" tpope's OpenURL function {{{
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
" open URL under cursor in browser
nnoremap gb :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
" }}}

set guifont=Consolas:h11:cANSI
set scroll=16
set window=33
set lines=40 columns=140
set guioptions-=lrb
set guioptions-=T
set guioptions-=r
set guioptions-=L
