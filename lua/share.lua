-------------------------------------
------------ Shared APIs ------------
-------------------------------------

local M = {}

------ Keymaps ------
function M.mapkey(keymaps)
    for _, value in pairs(keymaps) do
        vim.keymap.set(value[1], value[2], value[3], value[4])
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

return M
