-----------------------------------------------------------------
------------ Import The Most Important Configuration ------------
-----------------------------------------------------------------
require "leovim.config.options"
require "leovim.config.keymaps"
require "leovim.config.plugins"
-- Local configuration.
local os = require "os"
local home = os.getenv "HOME"
local result = os.execute(string.format("cat %s/.leovim.lua > /dev/null", home))
if result == 0 then
    -- File exists.
    dofile(string.format("%s/.leovim.lua", home))
end
