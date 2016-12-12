set t_Co=16
syntax enable
set background=dark
colorscheme solarized
set nu

" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

" Unite
nnoremap <leader>f :Unite -start-insert file_rec buffer<CR>
nnoremap <leader>/ :Unite -start-insert line<CR>

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" Window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fancy IPython
nnoremap <leader>p oimport IPython; shell = IPython.terminal.embed.InteractiveShellEmbed(); shell.mainloop()<ESC>

" Command output
nnoremap <leader>; :r!

" Scratch buffer
nnoremap <leader>s :e /tmp/scratch<CR>

" Kill buffers without having to kill the window
nnoremap <leader>bd :bp<CR>:bd#<CR>

set noswapfile
set nobackup

inoremap jj <ESC>
inoremap jk <ESC>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" More logical Y (default was alias for yy)
nnoremap Y y$

nnoremap <leader>vs :vsplit<CR>:Explore<CR>
nnoremap <leader>hs :split<CR>:Explore<CR>

" Write as sudo
cnoremap w!! w!sudo tee %

set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set smarttab
set smartindent

set smartcase
set incsearch
set ignorecase
set hlsearch
set showmatch

" set list listchars=tab:>-,trail:.,extends:>

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.go,*.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.go,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile *.go,*.py,*.pyw,*.c,*.h set fileformat=unix

let python_highlight_all=1
syntax on

au BufRead,BufNewFile *.go,*.py,*.py match ErrorMsg '\%>95v.\+'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" This rewires n and N to do the highlighing...
nnoremap <silent> n nzz:call HLNext(0.2)<cr>
nnoremap <silent> N Nzz:call HLNext(0.2)<cr>

" Treat JSON files like javascript
au BufNewFile,BufRead *.json set ft=javascript

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

augroup line_return
    au!
        au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' | 
        \ endif
augroup END

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

highlight WhiteOnRed guifg=white guibg=red

let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=60

nnoremap ; :
nnoremap : ;

let g:incpy#Name = "internal-python"
let g:Program = ""
let g:WindowRatio = 1.0/8

execute pathogen#infect()
