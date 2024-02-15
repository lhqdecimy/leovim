return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local ts = require 'telescope.builtin'
            local keymap = vim.keymap
            local opts = {
                noremap = true,
                silent = true
            }
            keymap.set('n', '<Leader>ff', ts.find_files, opts)
            keymap.set('n', '<Leader>fg', ts.live_grep, opts)
            keymap.set('n', '<Leader>fb', ts.buffers, opts)
            keymap.set('n', '<Leader>fh', ts.help_tags, opts)
            keymap.set('n', '<Leader>fm', ts.marks, opts)
        end
    }
}
