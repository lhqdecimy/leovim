Leovim is a Neovim IDE.

# Dependencies
1. git
2. ripgrep
3. unzip

# Installation
Make sure that your old configuration was saved:
```bash
mv ~/.config/nvim ~/nvim
```
...... And install Leovim:
```bash
git clone https://github.com/lhqdecimy/leovim ~/.config/nvim
```

# Usage
## Keymaps
The default leader key is space.

| Mode | Keys                                         | Action                         |
|------|----------------------------------------------|--------------------------------|
| I    | jk                                           | Quit Insert Mode               |
| I    | Tab                                          | Complete                       |
| I    | Ctrl e                                       | Abort                          |
| N    | Ctrl h / Ctrl j / Ctrl k / Ctrl l            | Move to other window           |
| N    | SPC sh / SPC sv                              | Split window                   |
| N    | Ctrl Up / Ctrl Down / Ctrl Left / Ctrl right | Resize window                  |
| N    | SPC q                                        | Close Buffer                   |
| N    | SPC w                                        | Save all                       |
| N    | SPC t t / SPC n                              | Toggle file tree               |
| N    | SPC t e                                      | Diagnostics                    |
| N    | SPC t s                                      | Symbols                        |
| N    | SPC t d                                      | Definitions / References / ... |
| N    | SPC t q                                      | Quickfix                       |
| N    | SPC T                                        | Open float terminal            |
| N    | SPC f f                                      | Find file                      |
| N    | SPC f g                                      | Find word                      |
| N    | SPC j / SPC k                                | Quick jump                     |
| N    | SPC h / SPC l                                | Change buffer                  |
| N    | SPC d                                        | Close buffer                   |
| N    | F                                            | Format                         |
| N    | K                                            | Document                       |
| N    | gD                                           | Goto declaration               |
| N    | gd                                           | Goto definition                |
| N    | gi                                           | Goto implementation            |
| N    | gr                                           | References                     |
| N    | gl                                           | Outline                        |
| N    | SPC R                                        | Rename                         |
| N    | SPC c                                        | Code action                    |
| N    | SPC u                                        | Undo tree                      |
| V    | > / <                                        | Shift                          |
| V    | S                                            | Surround                       |

There is a function named `mapkey` in `leovim`. You can use it to set keymaps easily.

```lua
require "leovim".mapkey {
    { <mode>, <key>, <map>, [<opts>] }, -- vim.keymap.set(<mode>, <key>, <map>, [<opts>])
                                        -- the default value of <opts> is { noremap = true, silent = true, desc = "Description" }
    ...
}
```

## LSP Servers
Use `:LspInstall` command to install LSP servers.

## Filetype Configuration
Change your filetype configuration by `leovim.filetype`
```
-- Default.
local leovim = require "leovim"

return {
    {
        pattern = "*",
        callback = function()
            leovim.setlocal {
                tabstop = 4,
                softtabstop = 4,
                expandtab = true,

                shiftwidth = 4,
                autoindent = true,
                smartindent = true,
                cindent = true,
            }
        end,
    },
    {
        pattern = { "c", "cpp" },
        callback = function()
            leovim.setlocal {
                tabstop = 2,
                softtabstop = 2,
                expandtab = true,

                shiftwidth = 2,
                autoindent = true,
                smartindent = true,
                cindent = true,

                makeprg = "make",
            }
        end,
    },
}
```

## Local Configuration
Put `.nvim.lua` into the current directory to load it. The user-configuration is `~/.leovim.lua`
