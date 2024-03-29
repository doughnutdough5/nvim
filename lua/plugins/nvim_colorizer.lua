return {
    'norcalli/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local status, colorizer = pcall(require, 'colorizer')

        if not status then return end

        colorizer.setup {
            css = {
                css = true;
                css_fn = true;
                mode = 'background';
            }
        }
    end
}
