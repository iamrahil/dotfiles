if filereadable(expand("~/.config/nvim/nvimrc.bundles"))
  source ~/.config/nvim/nvimrc.bundles
endif
set rtp^=/usr/share/vim/vimfiles/
set runtimepath+=$GOROOT/misc/vim
syntax on
set number
set relativenumber
filetype plugin indent on
set hlsearch
set incsearch
set magic
set smarttab
set autoindent
set autoread
set tabstop=4
set shiftwidth=4
map <Esc>[B <Down>]

set undofile
set undodir=~/.config/nvim/undodir

map <F8> :NERDTreeToggle<cr>
map <F9> :TagbarToggle<cr>
" let g:NERDTreeDirArrows=0

" Set default split positions
set splitright
set splitbelow

" Make enter finish the completion popup menu
nnoremap gp `[v`] 
set backspace=indent,eol,start
colorscheme yowish

" Move lines
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

set laststatus=2

"Display whitespace characters
set listchars=tab:│\ ,trail:·
set list

"Fold Methods
set foldmethod=indent
set nofoldenable    "Stop from folding at load

if has('mouse')
  set mouse=a
endif

"Buffer Mappings
nmap <C-e> :b#<CR>
nmap <C-PageUp> :bnext<CR>
nmap <C-PageDown> :bprev<CR>
nmap <leader>] :tabnext<CR>
nmap <leader>[ :tabprev<CR>

"Toggle Highlights
map <leader>q :noh<CR>

" Error mnemonic (Neomake uses location list)
nnoremap ]e :lnext<CR>
nnoremap [e :lprevious<CR>

"Functions
function Opaq()
  colorscheme yowish
endfunction

function Transp()
  hi! Normal ctermbg=NONE guibg=NONE
endfunction

" NeoVim specific stuff
set termguicolors
let test#strategy = 'neovim' " for vim-test

" Neovim terminal mappings
tnoremap <Leader><ESC> <C-\><C-n>

" Live substitute preview
set inccommand=nosplit

"Smart Home (VimTip315)
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction

noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/bower_components/*,*/node_modules/*,*/dist/*,*/build/*

"signify: updte git markers when vim gains focus
let g:signify_update_on_focusgained = 0

let g:deoplete#enable_at_startup = 1
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" Choosewine settings
nmap  <leader>w  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" For Lazy loading buffergator
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

function! VerticalLineHere(doeet)
    if a:doeet
        let &colorcolumn=col('.')
    else
        let &colorcolumn=0
    endif
endfunction
nnoremap <leader>line :call VerticalLineHere(1)<cr>
nnoremap <leader>ln :call VerticalLineHere(1)<cr>
nnoremap <leader>noline :call VerticalLineHere(0)<cr>
nnoremap <leader>nl :call VerticalLineHere(0)<cr>

nnoremap <c-P> <cmd>Telescope find_files<CR>
nnoremap <c-Y> <cmd>Telescope tags<CR>
nnoremap <c-L> <cmd>Telescope<CR>

lua <<EOF
require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
EOF

" vim: set ts=2 sw=2 et :
