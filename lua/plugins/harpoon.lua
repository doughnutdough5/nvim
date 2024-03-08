return {
    'ThePrimeagen/harpoon',
    event = 'VimEnter',
    config = function ()
        local harpoon_status, harpoon = pcall(require, 'harpoon')
        if not harpoon_status then return end

        local harpoon_mark_status, harpoon_mark = pcall(require, 'harpoon.mark')
        if not harpoon_mark_status then return end

        local harpoon_ui_status, harpoon_ui = pcall(require, 'harpoon.ui')
        if not harpoon_ui_status then return end

        harpoon.setup {
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            },
        }

        local opts = { noremap = true, silent = true }
        local keymap = vim.keymap

        keymap.set('n', '<leader>ha', harpoon_mark.add_file, opts)
        keymap.set('n', '<leader>hl', harpoon_ui.toggle_quick_menu, opts)

        keymap.set('n', '<leader>h1', function() harpoon_ui.nav_file(1) end, opts)
        keymap.set('n', '<leader>h2', function() harpoon_ui.nav_file(2) end, opts)
        keymap.set('n', '<leader>h3', function() harpoon_ui.nav_file(3) end, opts)
        keymap.set('n', '<leader>h4', function() harpoon_ui.nav_file(4) end, opts)
        keymap.set('n', '<leader>h5', function() harpoon_ui.nav_file(5) end, opts)
    end
}
