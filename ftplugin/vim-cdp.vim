runtime! syntax/cdp.vim

if exists("loaded_cdpvim") || &cp
	finish
endif
let loaded_cdpvim = 1

" Variables
let s:cdpBundlePath = expand('<sfile>:p:h:h')

if exists("g:cdpCompiler")
	let s:cdpCompiler = g:cdpCompiler
else
	let s:cdpCompiler = s:cdpBundlePath . "/bin/cdpCompiler"
endif

function CDPPlayUnderCursor()
	" echo system("pvplay " . CDPGetNameAfterDollar() . ".wav")
	exec '!pvplay ' . CDPGetNameAfterDollar() . ".wav"
endfunction

function CDPGetNameAfterDollar()
	let line = getline(".")
	if line =~'[$?]'
		return matchstr(line, '[^\$?].*')
	endif
endfunction

function CDPCompile()
	echo system(s:cdpCompiler . " " . expand('%:t'))
endfunction
