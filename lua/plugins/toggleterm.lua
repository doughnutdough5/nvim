return {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
        local status, toggleterm = pcall(require, 'toggleterm')
        
        if not status then return end

        toggleterm.setup {
            open_mapping = [[<c-\>]],
            size = 10,
            shade_terminals = true,
            auto_scroll = true,
            start_in_insert = true,
            persist_size = true,
            -- direction = 'tab'
            direction = 'horizontal',
        }
    end
}
