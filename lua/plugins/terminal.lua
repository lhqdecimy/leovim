return {
    {
        'akinsho/toggleterm.nvim',
        config = function ()
            require('toggleterm').setup()

            vim.keymap.set('n', '<Leader>T', ':ToggleTerm<CR>', {
                noremap = true,
                silent = true
            })
        end
    }
}
