------------------------------------------------------------
------------ Put your shift filetype here.      ------------
------------------------------------------------------------

local leovim = require "leovim"

return {
    {
        pattern = "*",
        callback = function()
            leovim.setlocal {
                tabstop = 4,
                softtabstop = 4,
                expandtab = true,

                shiftwidth = 4,
                autoindent = true,
                smartindent = true,
                cindent = true,
            }
        end,
    },
    {
        pattern = { "c", "cpp" },
        callback = function()
            leovim.setlocal {
                tabstop = 2,
                softtabstop = 2,
                expandtab = true,

                shiftwidth = 2,
                autoindent = true,
                smartindent = true,
                cindent = true,

                makeprg = "make",
            }
        end,
    },
    {
        pattern = "ruby",
        callback = function()
            leovim.setlocal {
                tabstop = 2,
                softtabstop = 2,
                expandtab = true,

                shiftwidth = 2,
                autoindent = true,
                smartindent = true,
                cindent = true,

                makeprg = "make",
            }
        end,
    },
    {
        pattern = "python",
        callback = function()
            leovim.setlocal {
                tabstop = 4,
                softtabstop = 4,
                expandtab = true,

                shiftwidth = 4,
                autoindent = true,
                smartindent = true,
                cindent = true,

                makeprg = "ruff",
            }
        end,
    },
    {
        pattern = { "html", "css" },
        callback = function()
            leovim.setlocal {
                tabstop = 2,
                softtabstop = 2,
                expandtab = true,

                shiftwidth = 2,
                autoindent = true,
                smartindent = true,
                cindent = true,
            }
        end,
    },
}
