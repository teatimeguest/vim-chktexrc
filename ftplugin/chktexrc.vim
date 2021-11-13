if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin=1

let s:save_cpo=&cpoptions
set cpoptions&vim

setlocal commentstring=#%s
setlocal comments=:#
let b:undo_ftplugin='setlocal commentstring< comments<'

let &cpoptions=s:save_cpo
unlet s:save_cpo
