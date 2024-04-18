-------------------------------
------------ Utils ------------
-------------------------------

local share = require "share"

-- Trouble
require "trouble".setup {}
share.mapkey {
    { "n", "<Leader>e", ":TroubleToggle<CR>" },
}

-- Tree
require "nvim-tree".setup {
    view = {
        -- Width
        width = 30,
    },
    filters = {
        -- Show hidden files
        dotfiles = true,
    },
}
share.mapkey {
    { "n", "<Leader>t", ":NvimTreeToggle<CR>" },
}

-- Buffers
require "bufferline".setup {}
share.mapkey {
    { "n", "<Leader>h", ":bprevious<CR>" },
    { "n", "<Leader>l", ":bnext<CR>" },
    { "n", "<Leader>d", ":bdelete<CR>" },
}

-- Terminal
require "toggleterm".setup {
    direction = "float",
}
share.mapkey {
    { "n", "<Leader>T", ":ToggleTerm<CR>" },
}

-- Which Key
require "which-key".setup {}

-- Motion
require "hop".setup {}
share.mapkey {
    { "n", "<Leader>j", ":HopWord<CR>" },
    { "n", "<Leader>k", ":HopChar1<CR>" },
}

-- Searching
local builtin = require('telescope.builtin')
share.mapkey {
    { "n", "<Leader>ff", builtin.find_files },
    { "n", "<Leader>fg", builtin.live_grep },
    { "n", "<Leader>fb", builtin.buffers },
}

-- Mru
require "mru".setup()
share.mapkey {
    { "n", "<Leader>fr", ":MruRepos<CR>" },
}

-- Auto Pairs
require "autoclose".setup()

-- Sessions
require "sessions".setup {
    session_filepath = vim.fn.stdpath("data") .. "/sessions",
    absolute = true,
}
share.mapkey {
    { "n", "<Leader>fs", ":SessionsLoad"}
}
