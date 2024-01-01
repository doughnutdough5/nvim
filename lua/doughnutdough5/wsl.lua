vim.cmd [[
    augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('/mnt/c/Windows/System32/clip.exe ',@")
    augroup END
]]
