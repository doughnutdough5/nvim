return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            local status, mason = pcall(require, 'mason')
            if not status then return end

            mason.setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            local status, mason_lspconfig = pcall(require, 'mason-lspconfig')
            if not status then return end

            mason_lspconfig.setup {
                ensure_installed = { 'lua_ls', 'tsserver', 'pylsp', 'gopls' }
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local status, lspconfig = pcall(require, 'lspconfig')
            if not status then return end

            lspconfig.lua_ls.setup {}
            lspconfig.tsserver.setup {}
            lspconfig.pylsp.setup {}

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
