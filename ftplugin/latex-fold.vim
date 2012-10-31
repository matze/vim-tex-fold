if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/tex.vim

setlocal foldmethod=expr
setlocal foldexpr=LaTexFold(v:lnum)
