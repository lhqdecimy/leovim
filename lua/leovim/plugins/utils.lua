-------------------------------
------------ Utils ------------
-------------------------------

local leovim = require "leovim"

return {
    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        main = "toggleterm",
        event = "VeryLazy",
        opts = {
            direction = "horizontal",
        },
        keys = {
            { "<Leader>T", "<Cmd>ToggleTerm<Cr>", desc = "Terminal" },
        },
    },
    -- Which Key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local which = require "which-key"
            which.setup {}
            which.add {
                { "<Leader>s", group = "Split Window" },
            }
        end,
    },
    -- Motion
    {
        "smoka7/hop.nvim",
        main = "hop",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<Leader>j", "<Cmd>HopWord<Cr>",  desc = "Goto Word" },
            { "<Leader>k", "<Cmd>HopChar1<Cr>", desc = "Goto Char" },
        },
    },
    -- Auto Pairs
    {
        "m4xshen/autoclose.nvim",
        event = "InsertEnter",
        main = "autoclose",
        opts = {},
    },
    -- Last place
    {
        "ethanholz/nvim-lastplace",
        main = "nvim-lastplace",
        opts = {},
        event = "BufEnter",
    },
    -- Trouble
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/which-key.nvim",
        },
        keys = {
            { "<Leader>te", "<Cmd>Trouble diagnostics toggle win.position=bottom<Cr>", { desc = "Diagnostics" } },
            { "<Leader>ts", "<Cmd>Trouble symbols toggle win.position=right<Cr>",      { desc = "Symbols" } },
            { "<Leader>td", "<Cmd>Trouble lsp toggle win.position=right<Cr>",          { desc = "Definitions / References / ..." } },
            { "<Leader>tq", "<Cmd>Trouble qflist toggle win.position=bottom<Cr>",      { desc = "Quickfix" } },
            { "<Leader>tl", "<Cmd>Trouble loclist toggle win.position=bottom<Cr>",     { desc = "Location List" } },
        },
        config = function()
            require "trouble".setup {
                auto_close = true,
                focus = true,
                warn_no_results = false,
            }
            require "which-key".add {
                { "<Leader>t", group = "Tree" },
            }
        end,
    },
    -- Files
    {
        "echasnovski/mini.files",
        dependencies = "echasnovski/mini.nvim",
        lazy = false,
        main = "mini.files",
        opts = {
            windows = {
                preview = true,
                width_preview = 100,
            },
        },
        keys = {
            { "<C-n>",      "<Cmd>lua MiniFiles.open()<Cr>", desc = "Goto file" },
            { "<Leader>tt", "<Cmd>lua MiniFiles.open()",     desc = "Goto file" },
        },
    },
    -- Buffers
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        main = "bufferline",
        config = function()
            require "bufferline".setup {}
            leovim.mapkey {
                { "n", "<Leader>h", "<Cmd>bprevious<Cr>", desc = "Previous Buffer" },
                { "n", "<Leader>l", "<Cmd>bnext<Cr>",     desc = "Next Buffer" },
                { "n", "<Leader>d", "<Cmd>bdelete<Cr>",   desc = "Close Buffer" },
            }
        end,
    },
    -- Searching
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/which-key.nvim",
            "folke/trouble.nvim",
        },
        main = "telescope",
        keys = function(plug)
            local builtin = require(plug.main .. ".builtin")
            return {
                { "<Leader>ff", builtin.find_files, desc = "Find File" },
                { "<Leader>fw", builtin.live_grep,  desc = "Find Word" },
                { "<Leader>fb", builtin.buffers,    desc = "Find Buffer" },
            }
        end,
        opts = function()
            -- Trouble
            local open_with_trouble = require "trouble.sources.telescope".open

            return {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = open_with_trouble },
                        n = { ["<c-t>"] = open_with_trouble },
                    },
                },
            }
        end,
        init = function()
            require "which-key".add {
                { "<Leader>f", group = "File" },
            }
        end,
    },
    -- Round Pairs
    {
        "tpope/vim-surround",
        config = function()
        end,
    },
    -- Undo Tree
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        main = "undotree",
        opts = {},
        keys = function(plug)
            local undotree = require(plug.main)
            return {
                { "<Leader>tu", undotree.toggle, desc = "Toggle Undo Tree" },
            }
        end,
    },
    -- Windows
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        main = "windows",
        opts = {},
        init = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
        end,
        keys = {
            { "<C-w>z", "<Cmd>WindowsMaximize<Cr>", desc = "Maximize" },
            { "<C-w>=", "<Cmd>WindowsEqualize<Cr>", desc = "Equalize" },
        },
    },
    -- Dap
    {
        "mfussenegger/nvim-dap",
        dependencies = "folke/which-key.nvim",
        event = "VeryLazy",
        main = "dap",
        init = function()
            require "which-key".add {
                { "<Leader>b", group = "Debug" },
            }
        end,
        keys = function(plug)
            local dap = require(plug.main)
            return {
                { "<Leader>bb", dap.toggle_breakpoint, desc = "Break Point" },
                { "<Leader>bc", dap.continue,          desc = "Continue" },
                {
                    "<Leader>bw",
                    function()
                        local widgets = require "dap.ui.widgets"
                        widgets.centered_float(widgets.frames)
                    end,
                    desc = "Look",
                },
            }
        end,
    },
}
