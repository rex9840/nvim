-- older key map in which key 


require('which-key').add(
        {
                { '<leader>f',  group = '[F]ile' },
                { '<leader>f_', hidden = true,     group = '[F]ile' },
                { '<leader>b',  group = '[B]uffer' },
                { '<leader>b_', hidden = true,     group = '[B]uffer' },
                { '<leader>m',  group = 'for[M]at' },
                { '<leader>m_', hidden = true,     group = 'for[M]at' },
                {'<leader>t', group = '[T]elescope'},
                {'<leader>t_', hidden = true, group = '[T]elescope'} 

        }
)
