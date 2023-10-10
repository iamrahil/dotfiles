# NeoVIM config

The neovim config is made for working in Neovim > 0.7

## SETUP
- Need to run `bash install.sh`
- To enable lsp servers. Add variables `g:custom#lspservers = [ 'listofservers' ]` somewhere in `custom.vim` or `lua/custom/init.lua`
> Eg: to enable solargraph and pyls, `g:custom#lspservers = ['solargraph', 'pyls']`

## Shortcuts
Although reading through [init.lua](init.lua) and [lua/configs/keymaps.lua](lua/configs/keymaps.lua) might be enough, some are listed for completeness

Leader is \

### BASICS
* F8: File tree browser toggle. Opens to path of file
* Shift-F8: File tree browser toggle. Opens to working dir
* Leader-q: disable highlights (highlights show after you search)
* Leader-? : Open cheatsheet in telescope (:CheatSheet! to open in popup)
* Leader-b: List all open buffers in telescope
* Leader-z: Zoom current buffer to full (Toggle)
* Control-PgUp/Dn: Switch between buffers
* Control-Alt-PgUp/Dn: Switch between tabs
* Leader-ci: toggle comments on line/block
* Control-w[Arrow/hjkl]: Move between windows directionally
* Control-p : fuzzy search filenames in telescope
* Control-ww: Move between windows

More Advanced Options follow

### General
* F9: TagbarToggle
* gp: visually select last used block
* Control-Up/Down: Move lines/block up/down
* Leader-ml : Print the modeline at the bottom of the file
* Leader-ln : Print ruler on the cursor position
* Leader-nl : Remove the ruler
* Control-l : Open Telescope popup
* Control-; : Open Telescope popup for commands
* Control-k : Open Telescope popup for metals (only for scala)
* Control-y: fuzzy search tags in telescope
* Leader-cfn : Copy filename:linenumber:column to the clipboard

### Motion
* Leader-Leader-s[b]: Search for character [b] in both directions
* Leader-Leader-f[b]: Search for character [b] forwards
* Leader-Leader-w: Start general forward find
* Leader-Leader-b: Start general backward find

### Errors/Warnings/Lints
* [L : Move to first lint warning
* ]L : Move to last lint warning
* ]l : Move to next lint warning
* [l : Move to previous lint warning

### Buffers/Tabs
* Control-e: Toggle last used buffer
* Leader-[ / ] : Switch between tabs
* Leader-lt: List open tabs
* Leader-Tab: Jump to previous tab

### Search
> Filters can be added by Control-6 on the popup menu

* Leader-gf : Find files in workspace
* Leader-gg : grep string under cursor
* Leader-gl : live grep in workspace


### Comments
* Leader-cc: comment out line/block (warning! will add multiple comments on existing)
* Leader-cu: Uncomment as above

### Surround
b1,b2: surrounding types. eg. ' " [] () {}
* cs[b1][b2]: replace b1 with b2 on selected block. eg. 'asv' -> "asv".

> cs[( adds space after replacing while cs[) does not, prefer the latter

* ys[text-object][b1]: wrap the verb block with b1. eg. ysw[, ys$[


### Telescope window
* Enter: open in current window
* Control-v: to open in vertical split
* Control-x: to open in horizontal split
* Control-t: to open in new tab

### Multiple Cursors
* Ctrl-n: Select same word as multiple cursors

### Window Selection/Movements
* Leader-w: Select window from open windows
* <Control-W><Space> : Switch to a popup window
* <Control-W>H/J/K/L : Move current window to Left/Down/Up/Right

### GIT Workflows

* Leader-M: open ViMagit (:Magit)
* :Git blame : Open Git-blame for current file (fugitive)
* Leader-gm : open popup to show last commit blame of the line

### Clipboard
* " : in Normal/Visual mode, open the clipboard registers
* Control-R : in Insert mode, open the clipboard registers

### LSP specific keybindings

For more info refer [this file](lua/configs/lsp.lua)

* gD : Jump to declaration
* gd : Jump to definition
* K : Show popup of signature/type
* gi : Jump to implementation
* gr : Jump to/List all references in quickfix window
* Leader-f : Format the current buffer for lint
* [d : Jump to prev code issue
* ]d : Jump to next code issue
* gpd : Preview definition
* gpi : Preview implementation
* gpr : Preview references
* gpq : Close all previews

### Terminal
* Leader-tt : Open terminal in new tab
* Leader-tv : Open terminal in vertical split
* Leader-tx : Open terminal in horizontal split
* Leader-Esc : Escape from terminal input mode to normal mode

### Tests
* Leader-ss : Run last test again
* Leader-sn : Run Nearest tets in file
* Leader-sf : Run tests of the entire file
* Leader-sg : Goto the last run test file

### Useful Unimpaired Shortcuts

* yoc : Toggle cursorline (highlight line)
* you : Toggle colorcolumn (highlit column)
* yox : Toggle both (crosshair highlight, combination of above)
* yow : Toggle wrap
* yon : Toggle line numbers
* yor : Toggle relative line numbers
