return {
    {
        'nvim-treesitter/nvim-treesitter',
        -- build = ':TSUpdate',
        -- load when new buffer create or before read exist buffer.
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = { 'TSInstallInfo', 'TSInstall' },
        config = function()
            local status, treesitter = pcall(require, 'nvim-treesitter.configs')

            if not status then return end

            treesitter.setup {
                -- use :TSInstall <language> when needed
                sync_install = false,
                auto_install = false,
                highlight = { enable = true },
                autopairs = { enable = true },
                autotag = { enable = true },
                indent = { enable = true },
            }
        end
    }
}
