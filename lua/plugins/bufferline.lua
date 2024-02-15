return {
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'bufferline'.setup()

            local keymap = vim.keymap
            local opts = {
                noremap = true,
                silent = true
            }

            keymap.set('n', '<Leader>h', ':bprevious<CR>', opts)
            keymap.set('n', '<Leader>l', ':bnext<CR>', opts)
            keymap.set('n', '<Leader>d', ':bdelete<CR>', opts)
        end
    }
}
