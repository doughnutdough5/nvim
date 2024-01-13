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
                ensure_installed = { 'tsserver', 'pylsp', 'gopls' }
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local status, lspconfig = pcall(require, 'lspconfig')
            if not status then return end

            local capabilities = require'cmp_nvim_lsp'.default_capabilities()

            lspconfig.pylsp.setup { capabilities = capabilities }
            lspconfig.tsserver.setup { capabilities = capabilities }

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
