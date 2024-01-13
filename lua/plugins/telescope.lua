return {
    {
        'nvim-telescope/telescope-ui-select.nvim',
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
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
                extensions = {
                    ['ui-select'] = {
                        require'telescope.themes'.get_dropdown({}),
                    },
                },
            }

            vim.keymap.set('n', '<leader>ff', require'telescope.builtin'.find_files, {})

            telescope.load_extension'ui-select'
        end
    },
}
