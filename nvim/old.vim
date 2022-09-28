map <Esc>[B <Down>]

" let g:NERDTreeDirArrows=0

" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

"Functions
function Opaq()
  colorscheme yowish
endfunction

function Transp()
  hi! Normal ctermbg=NONE guibg=NONE
endfunction

let test#strategy = 'neovim' " for vim-test

" Neovim terminal mappings
tnoremap <Leader><ESC> <C-\><C-n>

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
