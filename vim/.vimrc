" set nocompatible
" filetype plugin indent on

" Gotta take this from Spacemacs - so good
let mapleader = "\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

""" Vundle Init """

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Status bar at bottom of window "
Plugin 'itchyny/lightline.vim'

" Highlight the currently yanked characters "
Plugin 'machakann/vim-highlightedyank'

" Fuzzy searching "
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Display function signatures " 
Plugin 'Shougo/echodoc.vim'

" Vim syntax for TOML "
Plugin 'cespare/vim-toml'

" Auto character alignment in columns (:, = , ect) "
Plugin 'godlygeek/tabular'

" Go Vim
Plugin 'fatih/vim-go'

" Browse ctags 
Plugin 'majutsushi/tagbar'

" Intellisense engine for vim8
Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <leader><TAB> :b#<CR>


""" Vundle End """

set t_Co=256
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
" let g:solarized_termtrans = 1
set nu
set relativenumber
set colorcolumn=100

nnoremap <leader><TAB> :b#<CR>


if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Unite
" nnoremap <leader>f :Unite -start-insert file_rec buffer<CR>
" nnoremap <leader>/ :Unite -start-insert line<CR>

" CtrlP
" nnoremap <leader>/ :CtrlPBuffer<CR>
" nnoremap <leader>e :CtrlP<CR>
" nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" let g:ctrlp_show_hidden = 1

" Add System yank
" set clipboard=unnamedplus

" Window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Command output
" nnoremap <leader>; :r!

" Scratch buffer
" nnoremap <leader>s :e /tmp/scratch<CR>

" Kill buffers without having to kill the window
" nnoremap <leader>bd :bp<CR>:bd#<CR>
 
" Go Commands
" au FileType go nnoremap <leader>gr :GoRun<CR>
" au FileType go nnoremap <leader>gb :GoBuild<CR>
" au FileType go nnoremap <leader>gt :GoTest<CR>
" au FileType go nnoremap <leader>gd :GoDecls<CR>
" au FileType go nnoremap <leader>gD :GoDeclsDir<CR>
" au FileType go nnoremap <leader>gi :GoInfo<CR>

" Rust Commands
" nnoremap <leader>cb :!cargo build<CR>

set noswapfile
set nobackup

inoremap jj <ESC>
inoremap jk <ESC>

" noremap j gj
" noremap k gk
" noremap gj j
" noremap gk k

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

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:ale_sign_column_always = 1 
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check__all_targets = 1
let g:ale_fix_on_save = 1 
let g:ale_completion_enabled = 1 

let g:syntastic_rust_checkers = ['cargo']
" let g:rustfmt_command = 'rustup run stable rustfmt'

" let g:rustfmt_command = "rustfmt +nightly"
" let g:rustfmt_autosave = 1
" let g:rustfmt_emit_files = 1
" let g:rustfmt_fail_silently = 0
" let g:rust_clip_command = 'xclip -selection clipboard'
" let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" AsyncComplete rules
" Can now use TAB and SHIFT+TAB to maneuver around the autocomplete window
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"n

" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_auto_popup = 1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" autocmd FileType c,cpp ClangFormatAutoEnable

" Rust Language server
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 

" Go language server
if executable('gopls')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
            \ 'whitelist': ['go'],
            \ })
endif

" Go language server
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'go-langserver',
            \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
            \ 'whitelist': ['go'],
            \ })
endif

" Go language server
if executable('bingo')
    au User lsp_setup call lsp#register_server({
            \ 'name': 'bingo',
            \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
            \ 'whitelist': ['go'],
            \ })
endif

" Python language server
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" Fancy IPython
nnoremap <leader>p oimport IPython; shell = IPython.terminal.embed.InteractiveShellEmbed(); shell.mainloop()<ESC>

set autowrite

execute pathogen#infect()
