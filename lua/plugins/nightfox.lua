return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd'colorscheme nordfox'

            local status, nightfox = pcall(require, 'nightfox')
            if not status then return end

            nightfox.setup {
                options = {
                    styles = {
                        comments = 'italic',
                        keywords = 'bold',
                        types = 'bold',
                    },
                },
            }
        end,
    }
}
