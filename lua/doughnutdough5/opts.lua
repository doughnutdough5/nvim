local opt = vim.opt

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- vim.opt.title = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.wrap = true
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildmenu = true
opt.wildignore:append { '*/node_modules/*' }
opt.clipboard = { 'unnamed', 'unnamedplus' }
opt.hidden = true
opt.history = 50
opt.linebreak = true
opt.swapfile = false
opt.showmatch = true
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.termguicolors = true
vim.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
