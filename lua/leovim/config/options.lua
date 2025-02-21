----------------------------------------
------------ Basic Options -------------
----------------------------------------
local share = require "leovim.share"

share.options {
    ------ Apearance ------
    -- True Colors
    termguicolors = true,
    -- Line Number
    number = true,
    relativenumber = true,
    -- Lines
    cursorline = true,
    -- Others
    showmode = true,
    showcmd = true,
    showmatch = true,

    ------ Editor ------
    -- Completing
    completeopt = { "menu", "menuone", "noselect" },
    -- Undo
    undofile = true,
    ------ Searching ------
    incsearch = true,
    hlsearch = false,
    ignorecase = true,
    smartcase = true,

    ------ Others ------
    -- Clipboard
    clipboard = "unnamedplus",
    -- Mouse
    mouse = "a",
    -- Windows
    splitright = true,
    splitbelow = true,
    -- Local config
    exrc = true,
    -- Spell check
    spell = true,
}

-- Mouse
vim.cmd "aunmenu PopUp.-1-"
vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"

-- Filetype
share.filetype(require "leovim.default.filetype")
