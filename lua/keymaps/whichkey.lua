-- older key map in which key 

-- require('which-key').register {
--         ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
--         ['<leader>b'] = { name = '[B]uffer or [B]rowse ', _ = 'which_key_ignore' },
--         ['<leader>m'] = { name = 'for[M]at', _ = 'which_key_ignore' },
-- }


require('which-key').add(
        {
                { '<leader>f',  group = '[F]ile' },
                { '<leader>f_', hidden = true,     group = '[F]ile' },
                { '<leader>b',  group = '[B]uffer' },
                { '<leader>b_', hidden = true,     group = '[B]uffer' },
                { '<leader>m',  group = 'for[M]at' },
                { '<leader>m_', hidden = true,     group = 'for[M]at' },

        }
)
