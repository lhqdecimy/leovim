return {
    {
        'simrat39/symbols-outline.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        config = function()
            require 'symbols-outline'.setup()
            vim.keymap.set('n', '<Leader>fs', ':SymbolsOutline<CR>', {
                noremap = true,
                silent = true
            })
        end
    }
}
