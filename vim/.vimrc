set t_Co=16
syntax enable
set background=dark
colorscheme solarized
set nu

set nocompatible
filetype plugin on

" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

" Unite
" nnoremap <leader>f :Unite -start-insert file_rec buffer<CR>
" nnoremap <leader>/ :Unite -start-insert line<CR>

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap ;e :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" Add System yank
" set clipboard=unnamedplus

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
 
" Go Commands
nnoremap <leader>gr :GoRun<CR>
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gd :GoDecls<CR>
nnoremap <leader>gD :GoDeclsDir<CR>
nnoremap <leader>gi :GoInfo<CR>

" Rust Commands
nnoremap <leader>cb :!cargo build<CR>

set noswapfile
set nobackup

inoremap jj <ESC>
inoremap jk <ESC>

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Ignore files
set wildignore+=*.a,*.o
set wildignore+=*.DS_Store,.git,.hg,.svn
set wildignore+=*.pyc

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

" Search all paths recursively
set path+=**

" Display all matching files in a nice menu
set wildmenu

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

" au BufRead,BufNewFile *.go,*.py,*.py match ErrorMsg '\%>95v.\+'

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

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_rust_checkers = ['']
let g:rustfmt_autosave = 1

" rust-racer options
set hidden
let g:racer_experimental_completer = 1

" Supertab
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 

"
" " SuperTab like snippets behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp ClangFormatAutoEnable

execute pathogen#infect()
