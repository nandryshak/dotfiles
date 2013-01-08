" Functions file

" Formats HTML
function FormatHtml()
    ":%s/<[^>]*>/\r&\r/g " splits tags onto separate lins
    %s/^\s\+//ge
    exec "normal gg=G"
endfunction
" Copies buffer to system clipboard
function CopyAll()
    silent! :normal gg"+yGzz
endfunction
" Sets the working directory to the path of the current buffer
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

" Cleans up HTML copied from prweb
function PressReleaseCleanup()
    silent! %s/“/"/g
    silent! %s/”/"/g
    silent! %s/ onclick="linkClick(this.href)"//g
    silent! %s/<br \/>//g
    silent! %s/ class="releaseDateline"//g
    silent! %s/(PRWEB)/—/g
    silent! %s/# # #/<\/p><p>&<\/p>/g
    silent! %s/About LANshack.com/<p><strong>&<\/strong><\/p>/g
    silent! %s/Founded/<p>&/g
endfunction
