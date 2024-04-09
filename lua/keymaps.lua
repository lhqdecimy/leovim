local opts = {
    noremap = true,
    silent = true
}

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>', opts)

-- keymap.set('n', '<Leader>n', ':set number!<CR>', opts)
-- keymap.set('n', '<Leader>N', ':set relativenumber!<CR>', opts)

keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

keymap.set('n', '<C-Up>', ':resize -1<CR>', opts)
keymap.set('n', '<C-Down>', ':resize +1<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -1<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +1<CR>', opts)

keymap.set('v', '>', '>gv', opts)
keymap.set('v', '>', '<gv', opts)
keymap.set('v', 'J', ":m '>+1<CR>gv=gv'", opts)
keymap.set('v', 'K', ":m '<-2<CR>gv=gv'", opts)
