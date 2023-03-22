vim.cmd([[
" Remove trailing white space when saving
autocmd BufWritePre * %s/\s\+$//e

" Equalize splits when vim is resized
autocmd VimResized * wincmd =

" Disable auto comments on a new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])
