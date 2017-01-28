" Tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

setlocal keywordprg=pydoc

" convert print as a keyword in python 2 to a function for python 3
fun! PrintPython2ToPython3()
%s/\vprint\s+(.*)/print(\1)/c
endf
