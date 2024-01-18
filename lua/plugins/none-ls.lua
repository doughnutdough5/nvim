return {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local status, null_ls = pcall(require, 'null-ls')
        if not status then return end

        null_ls.setup {
            sources = {
                -- install formatter and linter from Mason
                -- javascript, typescript
                -- null_ls.builtins.code_actions.eslint_d,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.eslint_d,

                -- python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },
        }

        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}
