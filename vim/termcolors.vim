" Vim color file
" Maintainer:	Anders Lewis <greagle3@gmail.com>
" Last Change:	2018 Mar 4

" This color scheme imposes a (hopefully) sensible arrangement of the colors that
" your terminal is already using.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
"hi clear Normal
"set bg&

" Remove all existing highlighting and set the defaults.
"hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

hi Comment			ctermfg=Magenta
hi Constant		term=underline ctermfg=Green
hi Identifier	term=underline ctermfg=DarkCyan
hi Ignore					   ctermfg=Black
hi PreProc		term=underline ctermfg=Blue
hi Special		term=bold	   ctermfg=Red
hi Statement	term=bold	   ctermfg=DarkRed
hi Type						   ctermfg=DarkGreen
hi Error		term=reverse   ctermbg=DarkRed
hi Todo			term=standout  ctermbg=Red
" From the source:
hi Directory	term=bold	   ctermfg=DarkCyan
hi ErrorMsg		term=standout  ctermbg=Red
hi IncSearch	term=reverse   cterm=reverse
hi LineNr			term=bold			 ctermfg=Blue
hi ModeMsg		term=bold	   cterm=bold
hi MoreMsg		term=bold	   ctermfg=Green
hi NonText		term=bold	   ctermfg=DarkBlue
hi Question		term=standout  ctermfg=Green
hi SpecialKey	term=bold	   ctermfg=Magenta
hi StatusLine	term=reverse,bold cterm=reverse
hi StatusLineNC term=reverse   cterm=reverse
hi Title		term=bold	   ctermfg=Magenta
hi WarningMsg	term=standout  ctermfg=DarkRed
hi Visual		term=reverse   cterm=reverse

let colors_name = "termcolors"

" vim: sw=2
