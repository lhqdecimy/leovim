------------------------------------
------------ Style ------------
------------------------------------

-- Colorscheme
require "tokyonight".setup {}
vim.cmd "colorscheme tokyonight"
-- Messages
require "noice".setup {}
-- Status Line
require "lualine".setup {}
-- Indent
require "ibl".setup {}
-- Dashboard
local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
    "██          ██████████   ████████    ██      ██  ██████████  ██████████",
    "██          ██          ██      ██   ██      ██      ██      ██  ██  ██",
    "██          ██          ██      ██   ██      ██      ██      ██  ██  ██",
    "██          ██████████  ██      ██   ██      ██      ██      ██  ██  ██",
    "██          ██          ██      ██   ██      ██      ██      ██  ██  ██",
    "██          ██          ██      ██    ██    ██       ██      ██  ██  ██",
    "██████████  ██████████   ████████      ██████    ██████████  ██  ██  ██",
    "",
    "",
}
dashboard.section.footer.val = "Hello World"
dashboard.section.buttons.val = {
    dashboard.button("e", "New File", ":ene<CR>"),
    dashboard.button("SPC f f", "Find File"),
    dashboard.button("SPC f g", "Find Word"),
    dashboard.button("SPC f r", "View Mru"),
}
require "alpha".setup(dashboard.config)
-- Scroll
require "neoscroll".setup {}
