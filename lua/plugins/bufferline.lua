return {
    'akinsho/bufferline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    version = '*',
    config = function ()
        local status, bufferline = pcall(require, 'bufferline')
        if not status then return end
        
        bufferline.setup {
            options = {
                offsets = {
                    {
                        filetype = 'NvimTree',
                        text = 'NvimTree',
                        text_align = 'center',
                        highlight = 'Directory',
                    },
                },
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold,
                },
                close_command = false,
                right_mouse_command = false,
                left_mouse_command = false,
                middle_mouse_command = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match('error') and '' or ''
                    return icon
                end,
            },
        }
    end
}
