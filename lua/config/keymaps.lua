---------------------------------------
------------ Basic Keymaps ------------
---------------------------------------

-- Leader
vim.g.mapleader = " "

------ Keymaps ------
require "share".mapkey {
    -- Quit Insert Mode
    { "i", "jk",         "<Esc>" },

    ------ Windows ------
    -- Motion
    { "n", "<C-h>",      "<C-w>h" },
    { "n", "<C-j>",      "<C-w>j" },
    { "n", "<C-k>",      "<C-w>k" },
    { "n", "<C-l>",      "<C-w>l" },
    -- Spliting
    { "n", "<Leader>sh", ":split<CR>" },
    { "n", "<Leader>sv", ":vertical split<CR>" },
    -- Resizing
    { "n", "<C-Up>",     ":resize -2<CR>" },
    { "n", "<C-Down>",   ":resize +2<CR>" },
    { "n", "<C-Left>",   ":vertical resize -2<CR>" },
    { "n", "<C-Right>",  ":vertical resize +2<CR>" },

    ------ Others ------
    -- Shift
    { "v", "H",          "<gv" },
    { "v", "L",          ">gv" },
    -- Quit Windo(w
    { "n", "<Leader>q",  ":q<CR>" },
    -- Write
    { "n", "<Leader>w", ":wall<CR>"}
}
