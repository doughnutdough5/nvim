require'doughnutdough5.opts'
require'doughnutdough5.keymaps'
require'doughnutdough5.plugins'

-- when work on wsl2
if vim.fn.has'wsl' then
    require'doughnutdough5.wsl'
end
