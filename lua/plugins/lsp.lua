-----------------------------
------------ Lsp ------------
-----------------------------

------ Completing ------
local cmp = require "cmp"
cmp.setup {
    snippet = {
        expand = function(args)
            require("snippy").expand_snippet(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<Ctrl><Tab>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping.confirm { select = true },
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippy" },
    },
    {
        { name = "buffer" },
    }),
}
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    },
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    },
    {
        { name = "cmdline" }
    }),
    matching = { disallow_symbol_nonprefix_matching = false },
})

------ Installation ------
require "mason".setup {}
require "mason-lspconfig".setup {
    -- Auto Installation
    automatic_installation = true,
}
require "mason-lspconfig".setup_handlers {
    function(server_name)
        require "lspconfig"[server_name].setup {
            capabilities = require "cmp_nvim_lsp".default_capabilities()
        }
    end,
}

------ Lspconfig ------
local lspconfig = require "lspconfig"
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        local buf = vim.lsp.buf
        local share = require "share"
        share.mapkey {
            { "n", "gD", buf.declaration, opts },
            { "n", "gd", buf.definition, opts },
            { "n", "K", buf.hover, opts },
            { "n", "gi", buf.implementation, opts },
            { "n", "<C-k>", buf.signature_help, opts },
            { "n", "<Leader>wa", buf.add_workspace_folder, opts },
            { "n", "<Leader>wr", buf.remove_workspace_folder, opts },
            { "n", "<Leader>wl", function()
                print(vim.inspect(buf.list_workspace_folders()))
            end, opts},
            { "n", "<Leader>D", buf.type_definition, opts },
            { "n", "<Leader>R",buf.rename, opts },
            { { "n", "v" }, "<Leader>ca", buf.code_action, opts },
            { "n", "gr", buf.references, opts},
            { "n", "F", function() buf.format { async = true } end, opts },
        }
    end,
})
