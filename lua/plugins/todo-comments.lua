-- You can use this plugin to write keywords with colon
-- TODO, HACK, WARN, PERF, NOTE, TEST
return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    config = function()
        local status, todo = pcall(require, 'todo-comments')

        if not status then return end

        vim.keymap.set('n', '<leader>tn', function() todo.jump_next() end, { noremap = true, silent = true, desc = 'Next todo comment' })
        vim.keymap.set('n', '<leader>tp', function() todo.jump_prev() end, { noremap = true, silent = true, desc = 'Prev todo comment' })
        vim.keymap.set('n', '<leader>tl', ':TodoLocList<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>tt', ':TodoTelescope<cr>', { noremap = true, silent = true })

        todo.setup()
    end
}
