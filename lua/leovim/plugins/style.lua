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
    dashboard.button("e", "New File", "<Cmd>ene<Cr>"),
    dashboard.button("SPC f f", "Find File"),
    dashboard.button("SPC f w", "Find Word"),
    dashboard.button("q", "Quit", "<Cmd>q<Cr>"),
}
require "alpha".setup(dashboard.config)
-- Scroll
require "neoscroll".setup {}
-- Syntax
require "nvim-treesitter.configs".setup {
    -- Rainbow
    rainbow = {
        enable = true,
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        strategy = require "ts-rainbow".strategy.global,
    },
    ensure_installed = "all",
}
