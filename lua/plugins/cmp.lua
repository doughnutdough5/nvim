return {
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
            local status, cmp = pcall(require, 'cmp')
            if not status then return end

            require'luasnip.loaders.from_vscode'.lazy_load()

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert {
                    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<c-f>'] = cmp.mapping.scroll_docs(4),
                    ['<c-space>'] = cmp.mapping.complete(),
                    ['<cr>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1
                        if cmp.visible() then
                            cmp.select_next_item(select_opts)
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, { 'i', 's' }),
                    ['<s-tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item(select_opts)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = cmp.config.sources {
                    { name = 'path' },
                    { name = 'nvim_lsp', keyword_length = 1 },
                    { name = 'luasnip', keyword_length = 3 },
                    { name = 'buffer', keyword_length = 2 },
                },
            }

            local cmp_autopairs = require'nvim-autopairs.completion.cmp'
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
}
