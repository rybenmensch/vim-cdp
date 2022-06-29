" CDP PLUGIN
" kinda riffing on and off scvim

au BufEnter,BufWinEnter,BufNewFile,BufRead *.cdp set filetype=cdp
au BufEnter,BufWinEnter,BufNewFile,BufRead *.cdp runtime ftplugin/vim-cdp.vim
au BufEnter,BufWinEnter,BufNewFile,BufRead *.cdp runtime indent/cdp_indent.vim
" whatever the fuck that's supposed to mean
au BufEnter,BufWinEnter,BufNewFile,BufRead *.cdp let &iskeyword="@,48-57,_,192-255"

au FileType cdp let b:match_words = '(:),[:],{:},<:>'

" key bindings

" grab length of sound file under cursor
au Filetype cdp nnoremap <silent><leader>l :let @l = system("sndinfo len <C-r>=CDPGetNameAfterDollar()<CR>\|awk \'FNR==3 {print $2}\'")<CR>"lP

" play sound file under cursor
au Filetype cdp nnoremap <leader>. :call CDPPlayUnderCursor()<CR>
" play infile (first soundfile in list)
au Filetype cdp nnoremap <leader>, mi/[$?]<CR>ggn:call CDPPlayUnderCursor()<CR>'i
" play outfile(last soundfile in list
au Filetype cdp nnoremap <leader>- mo?[$?]<CR>ggn:call CDPPlayUnderCursor()<CR>'o

" delete file under cursor
au Filetype cdp nnoremap <leader>X :!rm <C-r>=CDPGetNameAfterDollar()<CR>.wav
" compile it
au Filetype cdp nnoremap <leader><CR> :w<CR>:call CDPCompile()<CR>
" backup file
au Filetype cdp nnoremap <leader>b :! mv out.wav 
