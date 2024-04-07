vim.api.nvim_create_autocmd('BufWinEnter', {
    desc = 'Return cursor to where it was last time closing the file',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove trailing whitespace on file save',
    pattern = '*',
    command = 'silent %s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Hide line number when opening a terminal buffer',
    pattern = '*',
    command = ':setlocal nonumber norelativenumber',
})

vim.api.nvim_create_autocmd('TermClose', {
    desc = 'Auto close the terminal when killed',
    pattern = '*',
    command = 'bdelete! ',
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight text on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    desc = 'Dont auto-comment on a new line',
    pattern = '*',
    command = 'set formatoptions-=cro',
})

