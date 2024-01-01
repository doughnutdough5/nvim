vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = true
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
-- vim.opt.wildmenu = true
-- vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.hidden = true
vim.opt.history = 50
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.showmatch = true
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
