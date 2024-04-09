return {
    {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',

        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn['vsnip#anonymous'](args.body)
                    end
                },
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({
                        select = true
                    })
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                }, {
                    { name = 'buffer' }
                })
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }
                }, {
                    { name = 'buffer' }
                })
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })

            require('mason').setup()
            require('mason-lspconfig').setup({
                automatic_installation = true
            })
            require('mason-lspconfig').setup_handlers({
                function (server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities()
                    })
                end
            })


            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local opts = {
                        buffer = ev.buf,
                        noremap = true,
                        silent = true
                    }
                    local keymap = vim.keymap
                    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    keymap.set('n', '<Leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
                    keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
                    keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    keymap.set('n', 'F', function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end
    }
}
