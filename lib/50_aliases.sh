

alias octave="octave --silent"
alias xa="xargs -n1"
alias chromium="chromium --app='https://google.com'"
alias grep="grep --color=auto"
alias bookis="papis -l books"
alias conis="papis -l contacts"

zat() {
  for i in $@; do
    [[ -f $i ]] && file=$i
  done
  [[ -n ${file} ]] &&
  zathura --data-dir=$(dirname $file)/zathura_cache/ $@ ||
  zathura $@
}
