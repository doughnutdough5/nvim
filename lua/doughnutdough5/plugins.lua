local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, 'lazy')
if not status then
    print('Cannot load lazy.nvim')
    return
end

-- plugins 폴더에 init.lua 없어도 잘 작동함.
lazy.setup('plugins')
