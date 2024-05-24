-------------------------------
------------ Utils ------------
-------------------------------

local share = require "share"

-- Trouble
require "trouble".setup {}
share.mapkey {
    { "n", "<Leader>e", "<Cmd>TroubleToggle<Cr>", { desc = "Trouble" } },
}

-- Tree
require "nvim-tree".setup {
    view = {
        -- Width
        width = 30,
    },
    filters = {
        -- Show hidden files
        dotfiles = false,
    },
}
share.mapkey {
    { "n", "<Leader>t", "<Cmd>NvimTreeToggle<Cr>", { desc = "Tree" } },
}

-- Buffers
require "bufferline".setup {}
share.mapkey {
    { "n", "<Leader>h", "<Cmd>bprevious<Cr>", { desc = "Previous Buffer" } },
    { "n", "<Leader>l", "<Cmd>bnext<Cr>",     { desc = "Next Buffer" } },
    { "n", "<Leader>d", "<Cmd>bdelete<Cr>",   { desc = "Close Buffer" } },
}

-- Terminal
require "toggleterm".setup {
    direction = "float",
}
share.mapkey {
    { "n", "<Leader>T", "<Cmd>ToggleTerm<Cr>", { desc = "Float Terminal" } },
}

-- Which Key
require "which-key".setup {}

-- Motion
require "hop".setup {}
share.mapkey {
    { "n", "<Leader>j", "<Cmd>HopWord<Cr>",  { desc = "Goto Word" } },
    { "n", "<Leader>k", "<Cmd>HopChar1<Cr>", { desc = "Goto Char" } },
}

-- Searching
local builtin = require "telescope.builtin"
share.mapkey {
    { "n", "<Leader>ff", builtin.find_files, { desc = "Find File" } },
    { "n", "<Leader>fw", builtin.live_grep,  { desc = "Find Word" } },
    { "n", "<Leader>fb", builtin.buffers,    { desc = "Find Buffer" } },
}

-- Auto Pairs
require "autoclose".setup {}

-- Last place
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        require "nvim-lastplace".setup {}
    end,
})
