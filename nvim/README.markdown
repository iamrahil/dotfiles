# VIM config

The vim config is made for working in Neovim > 0.7

## Shortcuts
Although reading through init.lua and lua/configs/keymaps.lua might be enough, some are listed for completeness

Leader is \

### General
* F8: NERDTreeToggle
* F9: TagbarToggle
* gp: visually select last used block
* Control-Up/Down: Move lines/block up/down
* Leader-q: disable highlights
* Control-ww: Move between windows
* Control-w[Arrow/hjkl]: Move between windows directionally
* Leader-ml: Print the modeline at the bottom of the file
* Leader-ln: Print ruler on the cursor position
* Leader-nl: Remove the ruler
* Leader-? : Open cheatsheet (:CheatSheet! to open in popup)
* Control-l : Open Telescope popup
* Control-; : Open Telescope popup for commands
* Control-k : Open Telescope popup for metals (only for scala)

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
* Leader-b: List all buffers
* Leader-z: Zoom current buffer to full (Toggle)

> Control-v/s/t to open in verticalsplit/horizontalsplit/tab

* Control-e: Toggle last used buffer
* Control-PgUp/Dn: Switch between buffers
* Control-Alt-PgUp/Dn: Switch between tabs

### Comments
* Leader-ci: toggle comments on line/block
* Leader-cc: comment out line/block (warning! will add multiple comments on existing)
* Leader-cu: Uncomment as above

### Surround
b1,b2: surrounding types. eg. ' " [] () {}
* cs[b1][b2]: replace b1 with b2 on selected block. eg. 'asv' -> "asv".

> cs[( adds space after replacing while cs[) does not, prefer the latter

* ys[text-object][b1]: wrap the verb block with b1. eg. ysw[, ys$[

### Ctrl-P
* Control-p: fuzzy search filenames
* Control-y: fuzzy search tags in files

#### Once open
* Enter: open in current window
* Control-v: to open in vertical split
* Control-x: to open in horizontal split
* Control-t: to open in new tab

### Multiple Cursors
* Ctrl-n: Select same word as multiple cursors


### Window Selection
* Leader-w: Select window from open windows
* <Control-W><Space> : Switch to a popup window

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

### Terminal
* Leader-t : Open terminal in new tab
* Leader-v : Open terminal in vertical split
* Leader-x : Open terminal in horizontal split
* Leader-Esc : Escape from terminal input mode to normal mode
