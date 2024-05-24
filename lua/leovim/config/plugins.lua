-----------------------------------------
------------ Install Plugins ------------
-----------------------------------------

------ Setup Lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Install Plugins
require "lazy".setup {
    -- Dashboard
    "goolord/alpha-nvim",
    -- Colorscheme
    "folke/tokyonight.nvim",
    -- Indent
    "lukas-reineke/indent-blankline.nvim",
    -- Scroll
    "karb94/neoscroll.nvim",
    -- Syntax
    "nvim-treesitter/nvim-treesitter",
    -- Rainbow
    "HiPhish/nvim-ts-rainbow2",
    -- Messages
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    -- Status Line
    { "nvim-lualine/lualine.nvim",     dependencies = "nvim-tree/nvim-web-devicons" }, ------ Utils ------ Terminal
    "akinsho/toggleterm.nvim",
    -- Which Key
    "folke/which-key.nvim",
    -- Motion
    "hadronized/hop.nvim",
    -- Auto Pairs
    "m4xshen/autoclose.nvim",
    -- Outline
    "hedyhli/outline.nvim",
    -- Last place
    "ethanholz/nvim-lastplace",
    -- trouble
    { "folke/trouble.nvim",            dependencies = "nvim-tree/nvim-web-devicons" },
    -- tree
    { "nvim-tree/nvim-tree.lua",       dependencies = "nvim-tree/nvim-web-devicons" },
    -- buffers
    { "akinsho/bufferline.nvim",       dependencies = "nvim-tree/nvim-web-devicons" },
    -- searching
    { "nvim-telescope/telescope.nvim", dependencies = "nvim-lua/plenary.nvim" },

    ------ Lsp ------
    -- Installation
    "williamboman/mason.nvim",
    "williamboman/mason.lspconfig.nvim",
    -- Config
    "neovim/nvim-lspconfig",
    -- Completing
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
}

-- Setup Plugins
require "leovim.plugins"
