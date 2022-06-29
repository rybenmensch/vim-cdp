syn clear

syn match	cdpAoperator	"{"
syn match	cdpAoperator	"}"

"numbers (what the fuck?)
syn match cdpInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								display
syn match cdpInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						display
syn match cdpInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								display
syn match cdpInteger	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								display
syn match cdpFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					display
syn match cdpFloat	"\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display

"comments
syn match  cdpLineComment  "\/\/.*" contains=@spell
syn region cdpComment  start="/\*"  end="\*/" contains=@Spell

"file names
syn match  cdpSoundName  "\$.*"
syn match  cdpAnaName "!.*"
syn match  cdpFileName "?.*"
syn match  cdpSoundNameO "\(\$\)\1.*"
syn match  cdpAnaNameO "\(!\)\1.*"
" syn match  cdpFileNameO "\(\)\1.*"
runtime! syntax/cdp_programs.vim
runtime! syntax/cdp_sdprograms.vim

hi def link cdpGroupTD Type
hi def link cdpGroupSD Tag
hi def link cdpGroupMC Type
hi def link cdpGroupReverb Type
hi def link cdpGroupSysUtils Type
hi def link cdpPrograms Statement

hi def link cdpSoundName Type
hi def link cdpAnaName Type
hi def link cdpFileName Type
hi def link cdpOverwriteName Type

hi def link cdpAoperator Statement
hi def link cdpInteger Number
hi def link cdpFloat Float
hi def link cdpLineComment Comment
hi def link cdpComment Comment

let b_current_syntax = "cdp"
