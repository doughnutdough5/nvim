local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = opts
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')

map('n', '<leader>bp', ':bprevious<cr>')
map('n', '<leader>bn', ':bnext<cr>')
map('n', '<leader>bd', ':bdelete<cr>')

map('n', '<c-h>', ':wincmd h<cr>', { silent = true })
map('n', '<c-j>', ':wincmd j<cr>', { silent = true })
map('n', '<c-k>', ':wincmd k<cr>', { silent = true })
map('n', '<c-l>', ':wincmd l<cr>', { silent = true })

map('', '<a-m>', '<esc>', { silent = true }) -- normal mode, visual mode, select mode
map('i', '<a-m>', '<esc>', { silent = true }) -- insert mode
map('c', '<a-m>', '<c-c>', { silent = true }) -- command-line mode

map('n', '<s-u>', '<c-r>')

map('n', '<a-j>', ':m .+1<CR>==')
map('n', '<a-k>', ':m .-2<CR>==')
map('i', '<a-j>', '<esc>:m .+1<CR>==gi')
map('i', '<a-k>', '<esc>:m .-2<CR>==gi')
map('v', '<a-j>', ":m '>+1<CR>gv=gv")
map('v', '<a-k>', ":m '<-2<CR>gv=gv")

