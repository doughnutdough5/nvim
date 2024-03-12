return {
    'folke/noice.nvim',
    event = 'VimEnter',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        local status, noice = pcall(require, 'noice')
        if not status then return end

        noice.setup {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
            presets = {
                bottom_search = false, -- disable classic bottom cmdline for search
                command_palette = false, -- position the cmdline on center
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            messages = {
                -- If enable messages, then the cmdline is enabled automatically because of current Neovim limitation.
                enabled = false, -- disables the Noice messages UI
            },
        }
    end,
}
