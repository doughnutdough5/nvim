return {
    'nvim-telescope/telescope.nvim',
    -- load after vim initialize
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local status, telescope = pcall(require, 'telescope')

        if not status then return end

        telescope.setup {
            defualts = {
                mappings = {
                    n = {
                        ['<c-c>'] = false,
                        ['<a-m>'] = require'telescope.actions'.close,
                    },
                },
                file_ignore_patterns = { 'node_modulse' },
            },
        }

        vim.keymap.set('n', '<leader>ff', require'telescope.builtin'.find_files, {})
    end
}
