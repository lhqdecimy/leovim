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

------ Shift ------
function M.shift(sh)
    for _, value in pairs(sh) do
        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = { "*." .. value[1] },
            callback = function()
                local opt = vim.opt
                local width = value[2]
                -- Set shift width
                opt.tabstop = width
                opt.shiftwidth = width
                opt.softtabstop = width
            end,
        })
    end
end

------ Local config ------
function M.local_config()
    local dir = vim.api.nvim_command_output "pwd"
    local name = dir .. "/.leovim.lua"

    local exists = function (name)
        local f = io.open(name, "r")
        if f then
            io.close(f)
            return true
        else
            return false
        end
    end

    if exists(name) then
        dofile(name)
    end
end

return M
