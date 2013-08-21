if exists("b:did_ftplugin")
  finish
endif

function! LaTeXFold(lnum)
    let line = getline(a:lnum)

    if line =~ '^\s*\\section'
        return '>1'
    endif

    if line =~ '^\s*\\subsection'
        return '>2'
    endif

    if line =~ '^\s*\\subsubsection'
        return '>3'
    endif

    if line =~ '^\s*\\begin{'
        return 'a1'
    endif

    if line =~ '^\s*\\end{'
        return 's1'
    endif

    return '='
endfunction

function! LaTeXFoldText()
    let fold_line = getline(v:foldstart)

    if fold_line =~ '^\s*\\\(sub\)*section'
        let pattern = '\\\(sub\)*section{\([^}]*\)}'
        let line = ' ' . substitute(fold_line, pattern, '➿ \2', '') . ' '
        return '+' . repeat(v:folddashes, 2) . line
    endif

    if fold_line =~ '^\s*\\begin'
        let pattern = '\\begin{\([^}]*\)}'
        let line = ' ' . substitute(fold_line, pattern, '✎  \1', '') . ' '
        return '+' . repeat(v:folddashes, 2) . line
    endif

    return fold_line
endfunction

setlocal foldmethod=expr
setlocal foldexpr=LaTeXFold(v:lnum)
setlocal foldtext=LaTeXFoldText()

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= "|setl foldexpr< foldmethod< foldtext<"
else
  let b:undo_ftplugin = "setl foldexpr< foldmethod< foldtext<"
endif
