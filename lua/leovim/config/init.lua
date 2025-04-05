-----------------------------------------------------------------
------------ Import The Most Important Configuration ------------
-----------------------------------------------------------------
require "leovim.config.options"
require "leovim.config.keymaps"
require "leovim.config.plugins"
-- Local configuration.
local os = require "os"
local result = os.execute "cat ~/.leovim.lua > /dev/null 2>&1"
if result == 0 then
    -- File exists.
    dofile "~/.leovim.lua"
end
