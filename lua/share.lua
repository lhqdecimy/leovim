-------------------------------------
------------ Shared APIs ------------
-------------------------------------

local M = {}

------ Keymaps ------
function M.mapkey(keymaps)
    for _, value in pairs(keymaps) do
        local opts = value[4]
        if opts == nil then
            opts = {
                noremap = true,
                silent = true,
            }
        end
        vim.keymap.set(value[1], value[2], value[3], opts)
    end
end

return M
