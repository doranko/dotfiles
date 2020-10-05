augroup filetypedetect
    au BufRead,BufNewFile *.tsv setfiletype TSV
    au BufRead,BufNewFile *.stan setfiletype c
augroup END
