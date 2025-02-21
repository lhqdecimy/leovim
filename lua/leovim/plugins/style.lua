------------------------------------
------------ Style ------------
------------------------------------

-- Colorscheme
require "tokyonight".setup {
    style = "night",
    transparent = true,
}
vim.cmd "colorscheme tokyonight"
-- Messages
require "noice".setup {
    cmdline = {
        view = "cmdline"
    }
}

-- Status Line
require "lualine".setup {}

-- Indent
require "ibl".setup {}

-- Dashboard
local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
    "",
    "",
    "",
    "",
    "                             WELCOME TO                                 ",
    "██|         ██████████|  ████████|   ██|     ██| ██████████| ██████████|",
    "██|         ██|         ██|     ██|  ██|     ██|     ██|     ██| ██| ██|",
    "██|         ██|         ██|     ██|  ██|     ██|     ██|     ██| ██| ██|",
    "██|         ██████████| ██|     ██|  ██|     ██|     ██|     ██| ██| ██|",
    "██|         ██|         ██|     ██|  ██|     ██|     ██|     ██| ██| ██|",
    "██|         ██|         ██|     ██|   ██    ██|      ██|     ██| ██| ██|",
    "██████████| ██████████|  ████████|     ██████|   ██████████| ██| ██| ██|",
    "                            BY LHQDECIMY                                ",
    "",
    "",
    "",
}

local math = require "math"
local os = require "os"
math.randomseed(tostring(os.time()):reverse():sub(1, 7))
local sentences = require "leovim.default.sentences"
local sentence = sentences[math.random(#sentences)]
dashboard.section.footer.val = sentence

dashboard.section.buttons.val = {
    dashboard.button("e", "New File", "<Cmd>ene<Cr>"),
    dashboard.button("SPC f f", "Find File"),
    dashboard.button("SPC f w", "Find Word"),
    dashboard.button("q", "Quit", "<Cmd>q<Cr>"),
}
require "alpha".setup(dashboard.config)
-- Scroll
require "neoscroll".setup {}
