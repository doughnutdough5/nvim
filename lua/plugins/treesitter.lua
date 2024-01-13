return {
    {
        'nvim-treesitter/nvim-treesitter',
        -- build = ':TSUpdate',
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = { 'TSInstallInfo', 'TSInstall' },
        config = function()
            local status, treesitter = pcall(require, 'nvim-treesitter.configs')
            if not status then return end

            treesitter.setup {
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                autopairs = { enable = true },
                autotag = { enable = true },
                indent = { enable = true },
            }
        end
    }
}
