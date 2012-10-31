if exists("b:did_ftplugin")
  finish
endif

function! LaTexFold(linenum)
    let line = getline(a:linenum)
    let next_line = getline(a:linenum+1)

    if next_line =~ '^\s*\\section' || next_line =~ '^\s*\\subsection'
        return 0
    endif

    if line =~ '^\s*\\documentclass'
        return 1
    endif

    if line =~ '^\s*\\section'
        return 2
    endif

    if line =~ '^\s*\\subsection'
        return 3
    endif

    return '='
endfunction

setlocal foldmethod=expr
setlocal foldexpr=LaTexFold(v:lnum)

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl foldexpr< foldmethod<"
else
  let b:undo_ftplugin = "setl foldexpr< foldmethod<"
endif
