------------------------------------------------------------
------------ Put your shift filetype here.      ------------
------------------------------------------------------------

local share = require "leovim.share"

return {
    {
        "*",
        function()
            share.setlocal {
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
        "c",
        function()
            share.setlocal {
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
        "cpp",
        function()
            share.setlocal {
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
}
