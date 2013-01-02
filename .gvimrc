set shell=cmd.exe
set nocp
set noswapfile

set backupcopy=yes
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

" Functions
	" FormatHTML
function FormatHtml ()
	:%s/<[^>]*>/\r&\r/g
	:g/^$/d
	:g/^\s\+$/d
	:normal gg=G
endfunction
	" CopyAll
function CopyAll()
	:normal gg"+yG
endfunction
    " Set directory
function SetDirectory()
    if filereadable(glob('~\atWork.txt'))
        :cd O:\Pages
        echo "Changed working directory to O:\\Pages"
    elseif filereadable('~\atHome.txt')
        :cd C:\Users\Nick\Desktop
        echo "Changed directory to ~\\Desktop"
    elseif filereadable('~/vps.txt')
        :cd ~
    else
        :cd
    endif
endfunction
	
" Normal Mode Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>n :tabnew<CR>
nnoremap <Leader>d :lcd %:p:h<CR>
nnoremap <C-c> :call CopyAll()<CR>
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

" autocmds
autocmd VimEnter * :call SetDirectory()

set guifont=Consolas:h11:cANSI
set scroll=16
set window=33
set lines=40 columns=140
set guioptions-=lrb
set guioptions-=T
set guioptions-=r
set guioptions-=L
