
"Run actual script being edited
function! VIMRun()
  let magic_word = "vim-run:"
  try
    "/.*/j is there so that it does not jump to the word
    exec "vimgrep /".magic_word."/j %"
    let qflist = getqflist()
    let whole_text = qflist[0]['text']
    let command_to_run=substitute(whole_text, "^.*".magic_word." *", "","")
    "echo whole_text
  catch
    try
      call VIMRunFile()
      return 0
    catch
      let command_to_run = './%'
    endtry
  endtry
  echo command_to_run
  exec ":!".command_to_run
endfunction
nnoremap <localleader><localleader>r :call VIMRun()<cr>

function! VIMRunFile()
  let vim_run = globpath(".", ".vim-run")
  "if ! filereadable(".vim-run")
  if len(vim_run) != 0
    exec ':!$SHELL .vim-run %'
  else
    throw 'No ".vim-run" file'
  endif
endfunction

if has("autocmd")
  autocmd BufRead .vim-run set ft=sh
endif