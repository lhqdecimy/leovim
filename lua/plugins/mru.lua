return {
    {
        'yegappan/mru',
        config = function()
            vim.keymap.set('n', '<Leader>fr', ':MRU<CR>', {
                noremap = true,
                silent = true
            })
        end
    }
}
