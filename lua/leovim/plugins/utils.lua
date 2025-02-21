-------------------------------
------------ Utils ------------
-------------------------------

local share = require "leovim.share"

-- Which Key
local which = require "which-key"
which.setup {}
which.add {
    { "<Leader>s", group = "Split Window" },
}

-- Trouble
require "trouble".setup {}
share.mapkey {
    { "n", "<Leader>te", "<Cmd>Trouble diagnostics toggle win.position=below<Cr>", { desc = "Diagnostics" } },
    { "n", "<Leader>ts", "<Cmd>Trouble symbols toggle win.position=right<Cr>",     { desc = "Symbols" } },
    { "n", "<Leader>td", "<Cmd>Trouble lsp toggle win.position=right<Cr>",             { desc = "Definitions / References / ..." } },
    { "n", "<Leader>tq", "<Cmd>Trouble qflist toggle win.position=below<Cr>",          { desc = "Quickfix" } },
}
which.add {
    { "<Leader>t", group = "Tree" },
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
    { "n", "<Leader>tt", "<Cmd>NvimTreeToggle<Cr>", { desc = "File Tree" } },
    { "n", "<Leader>n", "<Cmd>NvimTreeToggle<Cr>", { desc = "File Tree" } },
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
which.add {
    { "<Leader>f", group = "File" },
}

-- Auto Pairs
require "autoclose".setup {}

-- Last place
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        require "nvim-lastplace".setup {}
    end,
})

share.mapkey {
    { "n", "<Leader>*", "" },
}

-- Undo Tree
local undotree = require "undotree"
undotree.setup {}
share.mapkey {
    { "n", "<Leader>u", undotree.toggle, { desc = "Toggle Undo Tree" } }
}
