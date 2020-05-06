" fmt.vim: Vim command to format .opt files with optfmt.

if !exists('g:optfmt_fail_silently')
    let g:optfmt_fail_silently = 0
endif

" Below function is copied from vim-go's fmt.vim file.
function! optfmt#Format()

    if !(expand('%:p:h')=~#"cockroachdb")
        return
    endif

    let fmt_command = $GOPATH . "/src/github.com/cockroachdb/cockroach/bin/optfmt"
    echom fmt_command
    if !executable(fmt_command)
        echo "optfmt: could not find optfmt. Please install it from github.com/cockroachdb/cockroachdb with 'make bin/optfmt'."
        return ""
    endif

    " save cursor position and many other things
    let l:curw=winsaveview()

    " Write current unsaved buffer to a temp file
    let l:tmpname = expand('%') . ".tmp.opt"
    call writefile(getline(1, '$'), l:tmpname)

    " populate the final command with user based fmt options
    let command = fmt_command . ' -w '

    " execute our command...
    let out = system(command . " " . l:tmpname)

    " if there is no error on the temp file replace the output with the
    " current file.
    if v:shell_error == 0
        " remove undo point caused via BufWritePre
        try | silent undojoin | catch | endtry

        " Replace current file with temp file, then reload buffer
        call rename(l:tmpname, expand('%'))
        silent edit!
        let &syntax = &syntax
    elseif g:optfmt_fail_silently == 0
        echo out
        " We didn't use the temp file, so clean up
        call delete(l:tmpname)
    endif

    " restore our cursor/windows positions
    call winrestview(l:curw)
endfunction


" vim:ts=4:sw=4:et
