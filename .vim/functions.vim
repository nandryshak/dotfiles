" Functions file

" Increments a visual column of numbers. Make the whole columns one number.
" This number will be the starting point for the incrementation.
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Formats HTML
function FormatHtml()
    %s/^\s\+//ge
    exec "normal gg=G"
endfunction
" Split tags, delete blank lines
function SplitTags()
    :%s/></>\r</g " splits tags onto separate lins
    silent! :g/^$/d " deletes empty lines
    silent! :g/^\s*$/d " deletes lines with only whitespace
endfunction
" split CSS
function SplitCSS()
    :%s/; /&\r/ge
    :%s/{ /&\r/ge
    :%s/}/\r&/ge
endfunction
" Copies buffer to system clipboard
function CopyAll()
    silent! :normal gg"+yGzz
endfunction
" Sets the working directory to the path of the current buffer
function SetDirectory()
    if filereadable(glob('O:\NickWorkHours\atWork.txt'))
        :cd O:\Pages
    elseif filereadable(glob('~\NoDrive.txt'))
        :cd C:\Users\IPS_LANshack\Documents\Pages
    elseif filereadable('~\atHome.txt')
        :cd C:\Users\Nick\Desktop
    elseif filereadable('~/vps.txt')
        :cd ~
    else
        :cd ~
    endif
endfunction

" Cleans up HTML copied from prweb
function PressReleaseCleanup()
    silent! exec "g/user\-login/normal 5dd"
    silent! exec "g/create\-account/normal 5dd"
    silent! exec "g/###/normal dG"
    silent! %s/“/"/g
    silent! %s/”/"/g
    silent! %s/ onclick="linkClick(this.href)"//g
    silent! %s/<br \/>//g
    silent! %s/<br\/>//g
    silent! %s/ class="releaseDateline"//g
    silent! %s/(PRWEB)/—/g
    silent! %s/# # #/<\/p><p>&<\/p>/g
    silent! %s/About LANshack.com/<strong>&<\/strong><\/p>/g
    silent! %s/Founded/<p>&/g
    silent! %s/’/'/g
    silent! %s///g
endfunction

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
