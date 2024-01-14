return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local status, cmp = pcall(require, 'cmp')
        if not status then return end

        require'luasnip.loaders.from_vscode'.lazy_load()

        cmp.setup {
            completion = {
                completeopt = 'menu, menuone, preview, noselect',
            },
            formatting = {
                format = require'lspkind'.cmp_format {
                    mode = 'symbol_text',
                    menu = ({
                        buffer = '[Buffer]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[LuaSnip]',
                    }),
                },
            },
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
                { name = 'buffer' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }

        local cmp_autopairs = require'nvim-autopairs.completion.cmp'
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
