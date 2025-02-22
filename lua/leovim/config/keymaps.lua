---------------------------------------
------------ Basic Keymaps ------------
---------------------------------------

-- Leader
vim.g.mapleader = " "

------ Keymaps ------
require "leovim".mapkey {
    -- Insert Mode
    { "i", "jk",         "<Esc>",                       { desc = "Quit" } },

    ------ Windows ------
    -- Motion
    { "n", "<C-h>",      "<C-w>h",                      { desc = "Window Left" } },
    { "n", "<C-j>",      "<C-w>j",                      { desc = "Window Bottom" } },
    { "n", "<C-k>",      "<C-w>k",                      { desc = "Windown Top" } },
    { "n", "<C-l>",      "<C-w>l",                      { desc = "Window Right" } },
    -- Spliting
    { "n", "<Leader>sh", "<Cmd>split<Cr>",              { desc = "Split Horizontal" } },
    { "n", "<Leader>sv", "<Cmd>vertical split<Cr>",     { desc = "Split Vertical" } },
    -- Resizing
    { "n", "<C-Up>",     "<Cmd>resize -2<Cr>",          { desc = "Resize Horizontal" } },
    { "n", "<C-Down>",   "<Cmd>resize +2<Cr>",          { desc = "Resize Horizontal" } },
    { "n", "<C-Left>",   "<Cmd>vertical resize -2<Cr>", { desc = "Resize Vertical" } },
    { "n", "<C-Right>",  "<Cmd>vertical resize +2<Cr>", { desc = "Resize Vertical" } },

    ------ Others ------
    -- Shift
    { "v", "<",          "<gv",                         { desc = "Shift Left" } },
    { "v", ">",          ">gv",                         { desc = "Shift Right" } },
    -- Write
    { "n", "<Leader>w",  "<Cmd>wall<Cr>",               { desc = "Save" } },
}
