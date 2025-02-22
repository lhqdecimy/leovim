-------------------------------------
------------ Shared APIs ------------
-------------------------------------

local M = {}

------ Keymaps ------
function M.mapkey(keymaps)
    for _, value in pairs(keymaps) do
        local opts = {}
        for k, v in pairs(value) do
            if type(k) == "string" then
                opts[k] = v
            end
        end
        if opts.noremap == nil then
            opts.noremap = true
        end
        if opts.silent == nil then
            opts.silent = true
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
            pattern = config.pattern,
            callback = config.callback,
        })
    end
end

return M
