" A more sane folding text.
function! JavascriptFoldText()
    return getline(v:foldstart)
endfunction
setlocal foldtext=JavascriptFoldText()

" Clear conceal highlighting.
hi clear Conceal
