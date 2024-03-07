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
                ensure_installed = { 'tsserver', 'pylsp', 'gopls' },
                automatic_installation = true,
            }
        end
    },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local status, lspconfig = pcall(require, 'lspconfig')
            if not status then return end

            local capabilities = require'cmp_nvim_lsp'.default_capabilities()

            lspconfig.lua_ls.setup { capabilities = capabilities }
            lspconfig.pylsp.setup { capabilities = capabilities }
            lspconfig.tsserver.setup {
                capabilities = capabilities,
                cmd = { 'typescript-language-server', '--stdio' },
            }

            if vim.fn.has'win32' then
                lspconfig.csharp_ls.setup { capabilities = capabilities }
            end

            local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = ' ' }
            for type, icon in pairs(signs) do
                local hl = 'DiagnosticSign' .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {})
            vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>', {})
            vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_next, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
