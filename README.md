Leovim is a Neovim IDE.

# Dependencies
1. ripgrep

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

| Mode | Keys                                         | Action               |
|------|----------------------------------------------|----------------------|
| I    | jk                                           | Quit Insert Mode     |
| I    | Tab                                          | Complete             |
| I    | Ctrl e                                       | Abort                |
| N    | Ctrl h / Ctrl j / Ctrl k / Ctrl l            | Move to other window |
| N    | SPC sh / SPC sv                              | Split window         |
| N    | Ctrl Up / Ctrl Down / Ctrl Left / Ctrl right | Resize window        |
| N    | SPC q                                        | Close Buffer         |
| N    | SPC w                                        | Save all             |
| N    | SPC t                                        | Toggle tree          |
| N    | SPC T                                        | Open float terminal  |
| N    | SPC f f                                      | Find file            |
| N    | SPC f g                                      | Find word            |
| N    | SPC j / SPC k                                | Quick jump           |
| N    | SPC h / SPC l                                | Change buffer        |
| N    | SPC d                                        | Close buffer         |
| N    | F                                            | Format               |
| N    | K                                            | Document             |
| N    | gD                                           | Goto declaration     |
| N    | gd                                           | Goto definition      |
| N    | gi                                           | Goto implementation  |
| N    | gr                                           | References           |
| N    | gl                                           | Outline              |
| N    | SPC R                                        | Rename               |
| N    | SPC c                                        | Code action          |
| N    | SPC u                                        | Undo tree            |
| V    | > / <                                        | Shift                |
| V    | S                                            | Surround             |

There is a function named `mapkey` in `lua/share.lua`. You can use it to set keymaps easily.

```lua
require "share".mapkey {
    { <mode>, <key>, <map>, [<opts>] }, -- vim.keymap.set(<mode>, <key>, <map>, [<opts>])
    ...
}
```

## LSP Servers
There are 2 ways to install LSP servers:
1. Use `:LspInstall` command.
2. Edit `lua/mylsp.lua` (recommend).

```lua
-- lua/mylsp.lua
return {
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "ts_ls",
    "gopls",
    "html",
    "pyright",
}
```

## Shift Configuration
You can change the `vim.opt.shiftwidth` for each file type in `myshift.lua`.
```
return {
    { "*",   4 },
    { "c",   2 },
    { "cpp", 2 },
    { "h",   2 },
    { "hpp", 2 },
}
```

## Local Configuration
Put `.nvim.lua` into the current directory to load it.
