require('doughnutdough5.settings')
require('doughnutdough5.keybinds')
require('doughnutdough5.plugins')

-- when work on wsl2
if vim.fn.has('wsl') then
    require('doughnutdough5.wsl')
end
