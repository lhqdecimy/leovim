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
                desc = "Description",
            }
        else
            if opts.noremap == nil then
                opts.noremap = true
            end
            if opts.silent == nil then
                opts.silent = true
            end
        end
        vim.keymap.set(value[1], value[2], value[3], opts)
    end
end

------ Options ------
function M.options(options)
    for key, value in pairs(options) do
        vim.opt[key] = value
    end
end

------ Local Options ------
function M.setlocal(options)
    for key, value in pairs(options) do
        vim.opt_local[key] = value
    end
end
------ FileType ------
function M.filetype(filetype)
    for _, config in pairs(filetype) do
        vim.api.nvim_create_autocmd("FileType", {
            pattern = config[1],
            callback = config[2],
        })
    end
end

return M
