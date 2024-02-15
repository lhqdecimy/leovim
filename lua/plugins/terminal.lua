return {
    {
        'voldikss/vim-floaterm',
        config = function()
            local function set_size()
                local math = require 'math'

                local width = vim.api.nvim_win_get_width(0)
                local height = vim.api.nvim_win_get_height(0)

                local g = vim.g
                g.floaterm_width = math.floor(width * 0.8)
                g.floaterm_height = math.floor(height * 0.8)
            end
            local g = vim.g
            g.floaterm_title = 'Terminal'
            g.floaterm_autoclose = true

            vim.keymap.set('n', '<Leader>T', function()
                set_size()
                vim.cmd(':FloatermToggle<CR>')
            end, {
                noremap = true,
                silent = true
            })
        end
    }
}
