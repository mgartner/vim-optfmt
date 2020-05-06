if get(g:, "optfmt_autosave", 1)
    autocmd BufWritePre *.opt call optfmt#Format()
endif

command! -nargs=0 OptFmt call optfmt#Format()

" vim:ts=4:sw=4:et
