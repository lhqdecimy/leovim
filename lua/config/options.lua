----------------------------------------
------------ Basic Options -------------
----------------------------------------
local share = require"share"
local opt = vim.opt

------ Apearance ------
-- True Colors
opt.termguicolors = true
-- Line Number
opt.number = true
opt.relativenumber = true
-- Lines
opt.cursorline = true
-- Others
opt.showmode = true
opt.showcmd = true
opt.showmatch = true

------ Editor ------
-- Completing
opt.completeopt = { "menu", "menuone", "noselect" }
-- Shift
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop=4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
share.shift {
    { "*", 4 },
    { "c", 2 },
    { "cpp", 2 },
    { "h", 2 },
    { "hpp", 2 },
}

------ Searching ------
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

------ Others ------
-- Clipboard
opt.clipboard = "unnamedplus"
-- Mouse
opt.mouse = "a"
vim.cmd"aunmenu PopUp.-1-"
vim.cmd"aunmenu PopUp.How-to\\ disable\\ mouse"
-- Windows
opt.splitright = true
opt.splitbelow = true
