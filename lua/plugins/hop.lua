return {
    {
        'phaazon/hop.nvim',
        config = function()
            require 'hop'.setup()
            local keymap = vim.keymap
            local opts = {
                noremap = true,
                silent = true
            }
            keymap.set('n', '<Leader>j', ':HopWord<CR>', opts)
            keymap.set('v', '<Leader>j', ':HopWord<CR>', opts)
            keymap.set('n', '<Leader>k', ':HopChar1<CR>', opts)
            keymap.set('v', '<Leader>k', ':HopChar1<CR>', opts)
        end
    }
}
