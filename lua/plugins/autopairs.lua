return {
    {
        'windwp/nvim-autopairs',
        event = { 'InsertEnter' },
        config = function()
            local autopairs_status, autopairs = pcall(require, 'nvim-autopairs')
            local rule_status, rule = pcall(require, 'nvim-autopairs.rule')
            local conds_status, conds = pcall(require, 'nvim-autopairs.conds')

            if not autopairs_status then return end
            if not rule_status then return end
            if not conds_status then return end

            autopairs.setup {
                check_ts = true,
                fast_wrap = {
                    map = '<M-q>',
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = [=[[%'%"%>%]%)%}%,]]=],
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    manual_position = false,
                    highlight = 'PmenuSel',
                    highlight_grey = 'LineNr',
                },
            }

            autopairs.add_rules{
                rule("'", "'", 'python'):with_pair(conds.before_text('f')),
                rule('{', '}', 'python'):with_pair(conds.is_inside_quote()),
            }
        end
    },
    {
    -- set nvim treesitter first
       'windwp/nvim-ts-autotag',
    }
}
