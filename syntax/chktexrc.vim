if exists('b:current_syntax')
  finish
endif

let s:cpo_save = &cpoptions
set cpoptions&vim

syntax match chktexrcNumber display '\<\d\+\>' contained

syntax match chktexrcEscapeSequence display '![ "#!{}\[\]=bnrtf]' contained
syntax match chktexrcEscapeSequence display '!x[0-9,a-f]\{2}' contained
syntax match chktexrcEscapeSequence display '!d\%([01]\d\d\|2\%([0-4]\d\|5[0-5]\)\)' contained
syntax match chktexrcEscapeSequence display '!\%([0-2]\d\d\|3[0-6]\d\|37[0-7]\)' contained

syntax match chktexrcString
  \ display
  \ '"\%(!.\|[^!]\)*"'
  \ contains=chktexrcEscapeSequence
  \ contained

syntax match chktexrcPCREComment
  \ display
  \ '(?\%(!.\|[^!)]\)*)'
  \ contains=chktexrcEscapeSequence
  \ contained

syntax keyword chktexrcTodo TODO FIXME XXX

syntax region chktexrcComment
  \ start='#'
  \ end='$'
  \ contains=chktexTodo,@Spell

syntax keyword chktexrcQuoteStyle Traditional Logical

syntax keyword chktexrcKeyword
  \ Abbrev
  \ CenterDots
  \ CmdLine
  \ DashExcpt
  \ HyphDash
  \ IJAccent
  \ ItalCmd
  \ Italic
  \ Linker
  \ LowDots
  \ MathCmd
  \ MathEnvir
  \ MathRoman
  \ NoCharNext
  \ NonItalic
  \ NotPreSpaced
  \ NumDash
  \ OutFormat
  \ PostLink
  \ Primitives
  \ QuoteStyle
  \ Silent
  \ TabSize
  \ TeXInputs
  \ TextCmd
  \ UserWarn
  \ UserWarnRegex
  \ VerbClear
  \ VerbEnvir
  \ WipeArg
  \ WordDash
  \ nextgroup=
  \   chktexrcCaseInsensitiveList,
  \   chktexrcCaseSensitiveList,
  \   chktexrcEqualsSign
  \ skipempty
  \ skipwhite

syntax region chktexrcCaseSensitiveList
  \ fold
  \ matchgroup=chktexrcOperator
  \ start="{"
  \ skip="[^ ]}\|!."
  \ end="\%(^\| \)}"
  \ contains=
  \   chktexrcComment,
  \   chktexrcEscapeSequence,
  \   chktexrcPCREComment,
  \   chktexrcString
  \ nextgroup=chktexrcCaseInsensitiveList
  \ skipempty
  \ skipwhite

syntax region chktexrcCaseInsensitiveList
  \ fold
  \ matchgroup=chktexrcOperator
  \ start="\["
  \ skip="[^ ]\]\|!."
  \ end="\%(^\| \)\]"
  \ contains=
  \   chktexrcComment,
  \   chktexrcEscapeSequence,
  \   chktexrcPCREComment,
  \   chktexrcString
  \ nextgroup=chktexrcCaseSensitiveList
  \ skipempty
  \ skipwhite

syntax match chktexrcEqualsSign
  \ display
  \ '\%(!!\)*!\@<!='
  \ nextgroup=
  \   chktexrcCaseInsensitiveList,
  \   chktexrcCaseSensitiveList,
  \   chktexrcNumber,
  \   chktexrcQuoteStyle,
  \   chktexrcString
  \ skipempty
  \ skipwhite

highlight def link chktexrcNumber Number
highlight def link chktexrcEscapeSequence PreProc
highlight def link chktexrcString String
highlight def link chktexrcPCREComment String
highlight def link chktexrcTodo Todo
highlight def link chktexrcComment Comment
highlight def link chktexrcQuoteStyle Constant
highlight def link chktexrcKeyword Type
highlight def link chktexrcEqualsSign chktexrcOperator
highlight def link chktexrcOperator Operator

syntax sync minlines=200
syntax sync maxlines=500

let b:current_syntax = 'chktexrc'
unlet s:cpo_save
