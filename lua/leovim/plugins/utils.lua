-------------------------------
------------ Utils ------------
-------------------------------

local leovim = require "leovim"

return {
    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require "toggleterm".setup {
                direction = "float",
            }
            leovim.mapkey {
                { "n", "<Leader>T", "<Cmd>ToggleTerm<Cr>", desc = "Float Terminal" },
            }
        end,
    },
    -- Which Key
    {
        "folke/which-key.nvim",
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
        "hadronized/hop.nvim",
        config = function()
            require "hop".setup {}
            leovim.mapkey {
                { "n", "<Leader>j", "<Cmd>HopWord<Cr>",  desc = "Goto Word" },
                { "n", "<Leader>k", "<Cmd>HopChar1<Cr>", desc = "Goto Char" },
            }
        end,
    },
    -- Auto Pairs
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require "autoclose".setup {}
        end,
    },
    -- Outline
    {
        "hedyhli/outline.nvim",
        config = function()
        end,
    },
    -- Last place
    {
        "ethanholz/nvim-lastplace",
        config = function()
            vim.api.nvim_create_autocmd("BufEnter", {
                callback = function()
                    require "nvim-lastplace".setup {}
                end,
            })
        end,
    },
    -- Trouble
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "folke/which-key.nvim",
        },
        config = function()
            require "trouble".setup {
                auto_close = true,
                focus = true,
                warn_no_results = false,
            }
            leovim.mapkey {
                { "n", "<Leader>te", "<Cmd>Trouble diagnostics toggle win.position=bottom<Cr>", { desc = "Diagnostics" } },
                { "n", "<Leader>ts", "<Cmd>Trouble symbols toggle win.position=right<Cr>",      { desc = "Symbols" } },
                { "n", "<Leader>td", "<Cmd>Trouble lsp toggle win.position=right<Cr>",          { desc = "Definitions / References / ..." } },
                { "n", "<Leader>tq", "<Cmd>Trouble qflist toggle win.position=bottom<Cr>",      { desc = "Quickfix" } },
                { "n", "<Leader>tl", "<Cmd>Trouble loclist toggle win.position=bottom<Cr>",     { desc = "Location List" } },
            }
            require "which-key".add {
                { "<Leader>t", group = "Tree" },
            }
        end,
    },
    -- Tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
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
            leovim.mapkey {
                { "n", "<Leader>tt", "<Cmd>NvimTreeToggle<Cr>", desc = "File Tree" },
                { "n", "<Leader>n",  "<Cmd>NvimTreeToggle<Cr>", desc = "File Tree" },
            }
        end,
    },
    -- Buffers
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
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
        },
        config = function()
            local builtin = require "telescope.builtin"
            leovim.mapkey {
                { "n", "<Leader>ff", builtin.find_files, desc = "Find File" },
                { "n", "<Leader>fw", builtin.live_grep,  desc = "Find Word" },
                { "n", "<Leader>fb", builtin.buffers,    desc = "Find Buffer" },
            }
            require "which-key".add {
                { "<Leader>f", group = "File" },
            }
            -- Trouble
            local open_with_trouble = require "trouble.sources.telescope".open
            require "telescope".setup {
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = open_with_trouble },
                        n = { ["<c-t>"] = open_with_trouble },
                    },
                },
            }
        end,
    },
    -- Round Pairs
    {
        "tpope/vim-surround",
        config = function()
        end,
    },
    -- Visual Star Search
    {
        "bronson/vim-visual-star-search",
        config = function()
        end,
    },
    -- Undo Tree
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local undotree = require "undotree"
            undotree.setup {}
            leovim.mapkey {
                { "n", "<Leader>u", undotree.toggle, desc = "Toggle Undo Tree" }
            }
        end,
    },
}
