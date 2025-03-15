------------------------------------
------------ Style -----------------
------------------------------------

return {
    -- Dashboard
    {
        "goolord/alpha-nvim",
        config = function()
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
        end,
    },
    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        config = function()
            require "tokyonight".setup {
                style = "night",
                transparent = false,
            }
            vim.cmd "colorscheme tokyonight"
        end,
    },
    -- Indent
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            -- Indent
            require "ibl".setup {}
        end,
    },
    -- Scroll
    {
        "karb94/neoscroll.nvim",
        config = function()
            require "neoscroll".setup {}
        end,
    },
    -- Messages
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require "noice".setup {
                cmdline = {
                    view = "cmdline"
                }
            }
        end,
    },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require "lualine".setup {}
        end,
    },
}
