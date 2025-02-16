----------------------------------------
------------ Basic Options -------------
----------------------------------------
local share = require "share"
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
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
share.shift (require "myshift")
-- Undo
opt.undofile = true
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
vim.cmd "aunmenu PopUp.-1-"
vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"
-- Windows
opt.splitright = true
opt.splitbelow = true
-- Local config
opt.exrc = true
-- Spell check
opt.spell = true

-- Auto Save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    command = "wall",
})
