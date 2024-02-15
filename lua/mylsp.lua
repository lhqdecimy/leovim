local lsp = require('lspconfig')
local cap = require('cmp_nvim_lsp').default_capabilities()

lsp.pyright.setup {
    capabilities = cap
}

lsp.clangd.setup {
    capabilities = cap
}

lsp.jdtls.setup {
    capabilities = cap
}

lsp.lua_ls.setup {
    capabilities = cap
}

lsp.gopls.setup {
    capabilities = cap
}

lsp.rust_analyzer.setup {
    capabilities = cap,
    settings = {
        ['rust-analyzer'] = {},
    }
}
