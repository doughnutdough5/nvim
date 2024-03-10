return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    -- cmd = { 'NvimTreeOpen', 'NvimTreeFindFileToggle' },
    event = 'VeryLazy',
    config = function()
        local status, tree = pcall(require, 'nvim-tree')
        if not status then return end

        local keymap = vim.keymap

        local function my_on_attach(bufnr)
            local api = require'nvim-tree.api'

            local function options(desc)
                return {
                    desc = 'nvim-tree: ' .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true,
                }
            end

            api.config.mappings.default_on_attach(bufnr)

            -- delete default settings
            local key_list = {
                '<c-]>', '<c-e>', '<c-k>', '<c-r>', '<c-t>', '<c-x>', '<bs>', '<tab>', '>', '<', '.', '-',
                'bd', 'bt', 'bmv', 'B', 'C', '[c', ']c', 'D', 'e', ']e', '[e', 'F',
                'f', 'g?', 'gy', 'H', 'I', 'J', 'K', 'M', 'm', 'o', 'O', 'P',
                'q', 'r', 'R', 's', 'S', 'u', 'U', 'W', 'y', 'Y', '<2-LeftMouse>', '<2-RightMouse>',
            }

            for _, v in ipairs(key_list) do
                keymap.del('n', v, { buffer = bufnr })
            end

            -- customize my own keymap
            keymap.set('n', 'K', api.node.show_info_popup, options('Info'))
            keymap.set('n', 'v', api.node.open.vertical, options('Open: Vertical Split'))
            keymap.set('n', 'h', api.tree.toggle_hidden_filter, options('Toggle Filter: Dotfiles'))
            keymap.set('n', 'r', api.fs.rename_sub, options('Rename: Omit Filename'))
            keymap.set('n', 'R', api.tree.reload, options('Refresh tree'))
            keymap.set('n', 'x', api.fs.cut, options('Cut'))
            keymap.set('n', 'p', api.fs.paste, options('Paste'))
        end

        -- toggle key mapping
        keymap.set('n', '<c-n>', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

        tree.setup {
            on_attach = my_on_attach,
            view = { adaptive_size = true },
        }
    end
}
