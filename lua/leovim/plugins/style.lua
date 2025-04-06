------------------------------------
------------ Style -----------------
------------------------------------

return {
    -- Dashboard
    {
        "goolord/alpha-nvim",
        main = "alpha",
        opts = function()
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

            return dashboard.config
        end,
    },
    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        main = "tokyonight",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            transparent = false,
        },
        init = function(this)
            vim.cmd "colorscheme tokyonight"
        end,
    },
    -- Indent
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        event = "VeryLazy",
    },
    -- Scroll
    {
        "karb94/neoscroll.nvim",
        main = "neoscroll",
        opts = {},
        event = "VeryLazy",
    },
    -- Messages
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        main = "noice",
        opts = {
            cmdline = {
                view = "cmdline",
            },
        },
    },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        main = "lualine",
        opts = {},
    },
}
