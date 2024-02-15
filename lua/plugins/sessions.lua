return {
    {
        'Shatur/neovim-session-manager',
        config = function()
            local config = require 'session_manager.config'
            require 'session_manager'.setup {
                autoload_mode = config.AutoloadMode.Disabled
            }
            vim.keymap.set('n', '<Leader>sl', ':SessionManager load_last_session<CR>', {
                noremap = true,
                silent = true
            })
        end
    }
}
