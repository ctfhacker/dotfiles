" cscope w/ custom .vimrc files
" by salc@gmail.com
"
" more often than anything when I'm auditing code, people use
" different settings than I do. so my ts=4 will fuck up when I'm viewing
" the code for those nasty gnu projects.
" applications also tend to have multiple directories. which means as I'm
" navigating the project at the shell, and editing a file, I have to csc
" add the cscope db for the project everytime I run an instance of vim.
"
" to solve these problems, this script does 2 things.
" [1] it reads a ':'-separated list of db's from an environment variable: CSCOPE_DB
" [2] it sources a .vimrc from the directory of each CSCOPE_DB
"
" CSCOPE_DB is the paths to each cscope.out file you want to use.
" if the variable isn't specified, the current directory is checked

if has("cscope")
    let s:rcfilename = ".vimrc"
    let s:csfilename = "cscope"
    let s:pathsep = (has("unix") || &shellslash)? '/' : '\'
    let s:listsep = has("unix")? ':' : ';'

    let &cscopeverbose=1

    function! s:which(program)
        let sep = has("unix")? ':' : ';'
        let pathsep = (has("unix") || &shellslash)? '/' : '\'
        for p in split($PATH, sep)
            let path = join([substitute(p, s:pathsep, pathsep, 'g'), a:program], pathsep)
            if executable(path)
                return path
            endif
        endfor
        throw printf("Unable to locate %s in $PATH", a:program)
    endfunction

    function! s:basedirectory(path)
        if !isdirectory(a:path) && !filereadable(a:path)
            throw printf("%s does not exist", a:path)
        endif
        if isdirectory(a:path)
            return a:path
        endif
        return s:basedirectory(fnamemodify(a:path, ":h"))
    endfunction

    function! s:map_cscope()
        "echomsg "Enabling normal-mode maps for cscope in buffer " | echohl LineNr | echon bufnr("%") | echohl None | echon " (" | echohl MoreMsg | echon bufname("%") | echohl None | echon ")."
        nnoremap <buffer> <Space>c :cscope find c <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>d :cscope find d <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>e :cscope find e <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>f :cscope find f <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>g :cscope find g <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nnoremap <buffer> <Space>s :cscope find s <C-R>=expand("<cword>")<CR><CR>
        nnoremap <buffer> <Space>t :cscope find t <C-R>=expand("<cword>")<CR><CR>
    endfunction

    function! s:unmap_cscope()
        "echomsg "Disabling normal-mode maps for cscope in buffer " | echohl LineNr | echon bufnr("%") | echohl None | echon " (" | echohl MoreMsg | echon bufname("%") | echohl None | echon ")."
        silent! nunmap <buffer> <Space>c
        silent! nunmap <buffer> <Space>d
        silent! nunmap <buffer> <Space>e
        silent! nunmap <buffer> <Space>f
        silent! nunmap <buffer> <Space>g
        silent! nunmap <buffer> <Space>i
        silent! nunmap <buffer> <Space>s
        silent! nunmap <buffer> <Space>t
    endfunction

    function! s:add_cscope(path)
        if !filereadable(a:path)
            throw printf("File \"%s\" does not exist", a:path)
        endif

        let directory=s:basedirectory(a:path)
        let path=fnamemodify(a:path, printf(":p:gs?%s?/?", s:pathsep))

        " if a database is available, then add the cscope_db
        execute printf("silent cscope add %s %s", fnameescape(path), fnameescape(fnamemodify(directory,":p:h")))
        exec printf("echomsg \"Using cscope database \" | echohl MoreMsg | echon \"%s\" | echohl None", path)

        " also add the autocmd for setting mappings and sourcing a local .vimrc
        augroup cscope
            let base=fnamemodify(directory, printf(":p:gs?%s?/?", s:pathsep))
            exec printf("autocmd BufEnter,BufRead,BufNewFile %s* call s:map_cscope() | if filereadable(\"%s%s\") | source %s%s | endif", base, base, s:rcfilename, base, s:rcfilename)
            exec printf("autocmd BufDelete %s* call s:unmap_cscope()", base)
        augroup end
    endfunction

    " create a command that calls add_cscope directly
    command! -nargs=1 -complete=file AddCscope call s:add_cscope(<f-args>)

    set cscopetagorder=0
    " cheat and use `which` to find out where cscope is
    if empty(&cscopeprg)
        try
            let &cscopeprg=s:which(s:csfilename)
        catch
            let &cscopeprg=s:which(s:csfilename . ".exe")
        endtry
    endif

    " check if tmpdir was defined. if not set it to something
    " because cscope requires it.
    if empty($TMPDIR) && has("win32")
        let $TMPDIR=$TEMP
    endif

    " pass the environment variable to a local variable
    let cscope_db=$CSCOPE_DB

    " if db wasn't specified check current dir for cscope.out
    if empty(cscope_db) && filereadable("cscope.out")
        let cscope_db=join([getcwd(),"cscope.out"], s:pathsep)
    endif

    " iterate through each cscope_db
    for db in split(cscope_db, s:listsep)
        let verbosity = &cscopeverbose
        let &cscopeverbose = 0
        try
            call s:add_cscope(db)
        catch
            echoerr printf("cscope database %s does not exist", db)
        endtry
        let &cscopeverbose = verbosity
    endfor
endif

